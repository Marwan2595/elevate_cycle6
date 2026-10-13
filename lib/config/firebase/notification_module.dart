import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:injectable/injectable.dart';

@module
abstract class NotificationModule {
  @singleton
  NotificationService get notificationService =>
      NotificationService(FirebaseMessaging.instance);
}

/// Runs when a push arrives while the app is in the background / terminated.
/// Must be a top-level function.
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('Background message: ${message.notification?.title}');
}

/// Thin, reusable wrapper around Firebase Cloud Messaging.
class NotificationService {
  NotificationService(this._messaging);
  final FirebaseMessaging _messaging;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  // FCM does not show a banner while the app is open, so we show a local one.
  static const _channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High importance notifications',
    importance: Importance.high,
  );

  /// Asks for permission, prints the FCM token and wires the listeners.
  /// Call once after `Firebase.initializeApp()`.
  Future<void> init() async {
    await _messaging.requestPermission();
    await _initLocalNotifications();

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    final token = await getToken();
    // Copy this token into Firebase Console > Messaging > Send test message.
    log('FCM TOKEN: $token');
    // ignore: avoid_print
    print('FCM TOKEN: $token');

    _messaging.onTokenRefresh.listen((t) => log('FCM TOKEN REFRESHED: $t'));
    onForegroundMessage.listen((m) {
      log('Foreground message: ${m.notification?.title}');
      _showLocalNotification(m);
    });
  }

  Future<void> _initLocalNotifications() async {
    await _localNotifications.initialize(
      settings: const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),
    );
    final android = _localNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    await android?.createNotificationChannel(_channel);
    await android?.requestNotificationsPermission();
  }

  Future<void> _showLocalNotification(RemoteMessage message) async {
    final notification = message.notification;
    if (notification == null) return;

    final imageUrl =
        notification.android?.imageUrl ?? notification.apple?.imageUrl;
    final imageBytes = imageUrl == null ? null : await _downloadImage(imageUrl);

    String? iosImagePath;
    if (imageBytes != null) {
      final file = File(
        '${Directory.systemTemp.path}/notif_${DateTime.now().millisecondsSinceEpoch}.jpg',
      );
      await file.writeAsBytes(imageBytes);
      iosImagePath = file.path;
    }

    await _localNotifications.show(
      id: notification.hashCode,
      title: notification.title,
      body: notification.body,
      notificationDetails: NotificationDetails(
        android: AndroidNotificationDetails(
          _channel.id,
          _channel.name,
          importance: Importance.high,
          priority: Priority.high,
          styleInformation: imageBytes == null
              ? null
              : BigPictureStyleInformation(ByteArrayAndroidBitmap(Uint8List.fromList(imageBytes))),
        ),
        iOS: DarwinNotificationDetails(
          attachments: iosImagePath == null
              ? null
              : [DarwinNotificationAttachment(iosImagePath)],
        ),
      ),
    );
  }

  Future<List<int>?> _downloadImage(String url) async {
    try {
      final response = await Dio().get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      return response.data;
    } catch (e) {
      log('Notification image download failed: $e');
      return null;
    }
  }

  Future<String?> getToken() => _messaging.getToken();

  /// Pushes received while the app is open.
  Stream<RemoteMessage> get onForegroundMessage => FirebaseMessaging.onMessage;

  /// User tapped a notification while the app was in the background.
  Stream<RemoteMessage> get onMessageOpenedApp =>
      FirebaseMessaging.onMessageOpenedApp;

  /// User tapped a notification that launched the app from terminated state.
  Future<RemoteMessage?> getInitialMessage() => _messaging.getInitialMessage();

  Future<void> subscribeToTopic(String topic) =>
      _messaging.subscribeToTopic(topic);

  Future<void> unsubscribeFromTopic(String topic) =>
      _messaging.unsubscribeFromTopic(topic);
}

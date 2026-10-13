import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:elevate_cycle6/flavors.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @singleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: Flavor.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    dio.httpClientAdapter = _pinnedAdapter();
    return dio;
  }

  /// SSL pinning: reject the connection unless the server certificate's
  /// SHA-256 fingerprint matches one of the pins in `.env` (SSL_PINS).
  ///
  /// Get a fingerprint with:
  /// `openssl s_client -connect HOST:443 -servername HOST < /dev/null | openssl x509 -noout -fingerprint -sha256`
  ///
  /// The normal system chain validation still runs first; this check then
  /// pins the leaf certificate on top of it.
  ///
  /// Always ship a backup pin: when the server rotates its certificate
  /// (Let's Encrypt every ~90 days) an app with only the old pin stops working.
  IOHttpClientAdapter _pinnedAdapter() {
    return IOHttpClientAdapter(
      validateCertificate: (cert, host, port) {
        if (cert == null) return false;
        final fingerprint = sha256.convert(cert.der).toString().toUpperCase();
        final pins = Flavor.sslPins.map((p) => p.replaceAll(':', '').toUpperCase());
        return pins.contains(fingerprint);
      },
    );
  }
}

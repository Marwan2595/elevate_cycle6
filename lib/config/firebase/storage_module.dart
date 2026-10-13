import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class StorageModule {
  @singleton
  StorageService get storageService =>
      StorageService(FirebaseStorage.instance);
}

/// Thin, reusable wrapper around Firebase Storage.
class StorageService {
  StorageService(this._storage);
  final FirebaseStorage _storage;
//storageBucket --> assets/images/profie_picters/23765uayshbfc827f.png
  /// Uploads [file] to [path] (e.g. `products/123.jpg`) and returns its
  /// public download URL.
  Future<String> uploadFile(File file, String path) async {
    final ref = _storage.ref(path);
    await ref.putFile(file);
    // After Uploading the file, we can get the download URL using the getDownloadURL() method of the reference.
    return ref.getDownloadURL();
  }

  Future<String> uploadBytes(
    Uint8List bytes,
    String path, {
    String? contentType,
  }) async {
    final ref = _storage.ref(path);
    await ref.putData(bytes, SettableMetadata(contentType: contentType));
    return ref.getDownloadURL();
  }
//path : "assets/images/profie_picters/23765uayshbfc827f.png"
  Future<String> getDownloadUrl(String path) => _storage.ref(path).getDownloadURL();

  Future<void> delete(String path) => _storage.ref(path).delete();
}

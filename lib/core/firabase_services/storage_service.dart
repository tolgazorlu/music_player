import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageServisi {
  Reference _storage = FirebaseStorage.instance.ref();
  final DateTime zaman = DateTime.now();
  String? resimId;

  Future<String> userimgUpload(File resimDosyasi, String id) async {
    UploadTask yuklemeYoneticisi =
        _storage.child("images/musicImages/$id.jpg").putFile(resimDosyasi);

    TaskSnapshot snapshot = await yuklemeYoneticisi;

    String yuklenenResimUrl = await snapshot.ref.getDownloadURL();
    return yuklenenResimUrl;
  }
}

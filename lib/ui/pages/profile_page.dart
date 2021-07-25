import 'dart:io';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:image_picker/image_picker.dart';
import 'package:musicapps/core/firabase_services/storage_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? resim;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile page"),
      ),
      body: ElevatedButton(
        child: Text("resim yukle"),
        onPressed: () {
          _secimFotoGoster(context, "denemeID");
        },
      ),
    );
  }

  void _resimSec(
      ImageSource source, BuildContext context, String userID) async {
    final picker = ImagePicker();
    final secilen = await picker.getImage(source: source);

    // ignore: unnecessary_null_comparison
    if (secilen != null) {
      resim = File(secilen.path);
      setState(() {});
      Navigator.pop(context);

      // ? kayıt şlemi
      var tempFotoUrl = await StorageServisi().userimgUpload(resim!, userID);
      print("fotoURL");
      print("URL : " + tempFotoUrl);
    }
  }

  void _secimFotoGoster(BuildContext context, String userID) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("Galeriden Fotoğraf Seç"),
              onTap: () {
                _resimSec(ImageSource.gallery, context, userID);
              },
            ),
            ListTile(
              title: Text("Kameradan Fotoğraf Çek"),
              onTap: () {
                _resimSec(ImageSource.camera, context, userID);
              },
            ),
          ],
        ),
      ),
    );
  }
}

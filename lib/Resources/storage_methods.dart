import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class StorageMethods {

FirebaseStorage _fireStorage = FirebaseStorage.instance;
FirebaseAuth _fireAuth = FirebaseAuth.instance;

Future<String> imageUpload(String child, Uint8List file, bool isPost) async  {
print("reaching here ");
 Reference ref = _fireStorage.ref().child(child).child(_fireAuth.currentUser!.uid);
 UploadTask uploadTask = ref.putData(file);
 TaskSnapshot snap = await uploadTask;
 String downloadUrl= await   snap.ref.getDownloadURL();
 return downloadUrl; 

}


}
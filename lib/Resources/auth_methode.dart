import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/Resources/storage_methods.dart';

class AuthMethods{
  
  final FirebaseAuth auth= FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Future<String> signUp({
    required String email,
    required String password,
    required String username,
    required String bio,
    required Uint8List file
    }
  ) async  {
    String res ="Some error in the form ";
    try{
      if(email.isNotEmpty|| password.isNotEmpty|| bio.isNotEmpty|| username.isNotEmpty|| file!= null ){
        UserCredential userCr = await auth.createUserWithEmailAndPassword(email: email, password: password);
        print(userCr.user!.uid);
        print("reaching around here ");
       String photoUrl = await  StorageMethods().imageUpload('ProfilePics', file, false);

        print(photoUrl);
        _fireStore.collection('users').doc(userCr.user!.uid).set(
          {'userName':username,
           'bid':userCr.user!.uid,
           'email':email,
           'bio':bio,
           'followers':[],
           'following':[],
           'photoUrl':photoUrl
                 }
              );
              res="success";
      }

    }catch(err){
        res = err.toString();
        
    }
    return res;
  }
  Future<String> loginUser({required String email,required String password})async{
    String res ="Some Errores in teh form ";

    try {
      if(email.isNotEmpty || password.isNotEmpty){
        await auth.signInWithEmailAndPassword(email: email, password: password);
        res="success";
      }else{
        res="Please enter all the fields";
      }
        
      } catch (e) {
        res=e.toString();
      }

    return res;
  }
}
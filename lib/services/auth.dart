import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


abstract class AuthImplementaion {

}
class AuthMethods implements AuthImplementaion {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signInWithEmailAndPassword(String email, String password) async{
    try{
      FirebaseUser firebaseUser = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)).user;
      return firebaseUser.uid;
    }catch(e){
      print(e.toString());
    }
  }

  Future<String> signUpWithEmailAndPassword(String email, String password) async{
    try{
      FirebaseUser firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password)).user;
      return firebaseUser.uid;
    }catch(e){
      print(e.toString());
    }
  }

  Future<String> resetPass(String email){
    try{
      return _firebaseAuth.sendPasswordResetEmail(email: email);
    }catch(e){
      print(e.toString());
    }
  }

  Future<String> signOut(){
    try{
      return  _firebaseAuth.signOut();
    }catch(e){
      print(e.toString());
    }
  }
}


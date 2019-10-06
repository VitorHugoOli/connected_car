import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';



class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> signIn(String email, String password) async {
    print("Ta vindo0");
    FirebaseUser user = (await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    )).user;
    return user.uid;
  }

  Future<String> signUp(String email, String password, String nome) async {
    FirebaseUser user = (await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    )).user;
    UserUpdateInfo updateUser = UserUpdateInfo();
    updateUser.displayName = nome;
    user.updateProfile(updateUser);
    return user.uid;
  }

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user;
  }

  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }

  Future<void> sendEmailVerification() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    user.sendEmailVerification();
  }

  Future<bool> isEmailVerified() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user.isEmailVerified;
  }

}
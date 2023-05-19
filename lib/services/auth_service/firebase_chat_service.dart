import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _firebase = FirebaseAuth.instance;
final _firestore = FirebaseFirestore.instance;
final _firestorage = FirebaseStorage.instance;

class FirebaseChatServices {
  static Future<bool> sendChatMessage(String message) async {
    var snapshot = await _firestore
        .collection("users")
        .doc(_firebase.currentUser!.uid)
        .get();
    if (!snapshot.exists) {
      await _firestore.collection("chat").add({
        "uid": _firebase.currentUser!.uid,
        "username": snapshot.data()!['username'],
        "photo": snapshot.data()!['photo'],
        "message": message,
        "createdAt": Timestamp.now()
      });
    }
    return true;
  }

  static Future<bool> saveUserData() async {
    var snapshot = await _firestore
        .collection("users")
        .doc(_firebase.currentUser!.uid)
        .get();
    if (snapshot.exists) {
      await _firestore.collection("users").doc(_firebase.currentUser!.uid).set({
        "uid": _firebase.currentUser!.uid,
        "username": _firebase.currentUser!.displayName,
        "photo": _firebase.currentUser!.photoURL,
        "email": _firebase.currentUser!.email,
      });
    }
    return true;
  }

  static Future authDoLogin() async {
    // Trigger the authentication flow
    final GoogleSignIn googleSignin = GoogleSignIn(
      scopes: [
        'email',
      ],
    );
    try {
      await googleSignin.disconnect();
    } catch (_) {}
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignin.signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleSignInAccount?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      log(credential.toString());

      User? user = (await _firebase.signInWithCredential(credential)).user;

      await saveUserData();
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future authSignUpWithEmailAndPassword(
      String email, String password, String username, File profileImage) async {
    try {
      final signUpProcess = await _firebase.createUserWithEmailAndPassword(
          email: email, password: password);
      final uploadedImage = _firestorage
          .ref()
          .child('profile_image')
          .child('${signUpProcess.user!.uid}.jpg');
      await uploadedImage.putFile(profileImage);
      final photoProfile = await uploadedImage.getDownloadURL();
      print(photoProfile);
      // Save signup data into firestore
      _firestore.collection('users').doc(signUpProcess.user!.uid).set({
        "uid": signUpProcess.user!.uid,
        "username": username,
        "photo": photoProfile,
        "email": email,
      });
    } on FirebaseAuthException catch (_) {}
  }

  static Future authSignInWithEmailAndPassword(
      String email, dynamic password) async {
    try {
      await _firebase.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e);
    }
  }

  static Future checkIsLogin() async {
    try {
      await _firebase.authStateChanges();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  static Future imageUpload(FirebaseAuth auth) async {}

  static Future doLogout() async {
    FirebaseAuth.instance.signOut();
    log('is Logout');
  }
}

import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _firebase = FirebaseAuth.instance;

class AuthServices {
  static Future<bool> saveUserData() async {
    var snapshot = await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (!snapshot.exists) {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "photo": FirebaseAuth.instance.currentUser!.photoURL,
        "email": FirebaseAuth.instance.currentUser!.email,
        "name": FirebaseAuth.instance.currentUser!.displayName,
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

      User? user =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;

      await saveUserData();
      return true;
    } catch (_) {
      return false;
    }
  }

  static Future authSignUpWithEmailAndPassword(
      String email, dynamic password, File profileImage) async {
    try {
      final signUpProcess = await _firebase.createUserWithEmailAndPassword(
          email: email, password: password);
      final uploadedImage = FirebaseStorage.instance
          .ref()
          .child('profile_image')
          .child('${signUpProcess.user!.uid}.jpg');
      await uploadedImage.putFile(profileImage);
      uploadedImage.getDownloadURL();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-user') {}
    }
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

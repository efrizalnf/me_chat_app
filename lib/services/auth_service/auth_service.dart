import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

      User? usser =
          (await FirebaseAuth.instance.signInWithCredential(credential)).user;

      await saveUserData();
      return true;
    } catch (_) {
      return false;
    }
  }
}

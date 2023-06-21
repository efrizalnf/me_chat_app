import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  User? get user => _user;
  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }
}

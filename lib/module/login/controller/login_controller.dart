import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:me_chat_app/services/auth_service/auth_service.dart';
import 'package:me_chat_app/state_util.dart';
import '../view/login_view.dart';

class LoginController extends State<LoginView> implements MvcController {
  static late LoginController instance;
  late LoginView view;

  doLogin() {
    AuthServices.authDoLogin();
  }

  checkUsername() {
    if (doLogin() == true) {
      var user = FirebaseAuth.instance.currentUser!.displayName;
      var email = FirebaseAuth.instance.currentUser!.email;
      log('$user and $email');
    } else {
      return false;
    }
  }

  doLogout() {
    FirebaseAuth.instance.signOut();
    log('is Logout');
  }

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

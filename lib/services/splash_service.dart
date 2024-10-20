import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foodiegala/auth/sign_up_screen.dart';

class SplashServices {
  void logins(BuildContext context) {
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const SignUp(),
        ),
      );
    });
  }
}

import 'dart:async';

import 'package:chat/screens/create_account/create_account.dart';
import 'package:chat/screens/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/my_provider.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(
          context,
          provider.firebaseUser != null
              ? HomeScreen.routeName
              : CreateAccount.routeName);
    });
    return SafeArea(
      child: Stack(
        children: [
          Image.asset(
            'assets/images/splash.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(child: Image.asset('assets/images/logo.png'))
        ],
      ),
    );
  }
}
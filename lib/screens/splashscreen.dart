import 'package:e_learning/screens/Login/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    gotologin(context);
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
          child: Text(
        'Design Thinking',
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }

  Future<void> gotologin(BuildContext ctx) async {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(ctx)
          .pushReplacement(MaterialPageRoute(builder: ((ctx) => LoginPage())));
    });
  }
}

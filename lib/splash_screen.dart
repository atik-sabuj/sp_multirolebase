import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sp_multirolebase/home_page.dart';
import 'package:sp_multirolebase/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Program Asche');
    Timer(Duration(seconds: 3), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => LoginPage())
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    print('Build Method');
    return Scaffold(
      body: Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage('https://render.fineartamerica.com/images/images-profile-flow/400/images-medium-large-5/pomegranate-opened-up-on-reflective-surface-johan-swanepoel.jpg'),),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_multirolebase/home_page.dart';
import 'package:sp_multirolebase/login_page.dart';
import 'package:sp_multirolebase/teacher_page.dart';
import 'student_page.dart';

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

    isLogin();
  }

  void isLogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;
    String userType = sp.getString('userType') ?? '';

    if(isLogin){

      if(userType == 'student'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => StudentPage())
          );
        });
      }else if(userType == 'teacher'){
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TeacherPage())
          );
        });
      }else {
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage())
          );
        });
      }
      Timer(Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage())
        );
      });
    }else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LoginPage())
        );
      });
    }
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

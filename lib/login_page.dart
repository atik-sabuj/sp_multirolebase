import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: ()async{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('name', 'atik sabuj');
                  sp.setInt('age', 25);
                  sp.setBool('isLogin', false);

                  print(sp.getString('name'));
                  print(sp.getInt('age').toString());
                  print(sp.getBool('isLogin').toString());
                  
                  sp.remove('name');
                  print(sp.getString('name'));


                  },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.green,
                  child: Center(
                    child: Text('Click'),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}

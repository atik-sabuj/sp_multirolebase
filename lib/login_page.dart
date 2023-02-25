import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sp_multirolebase/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log In'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Age',
                ),
              ),
              SizedBox(height: 40,),
              InkWell(
                onTap: ()async{
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('email', emailController.text.toString());
                  sp.setString('age', ageController.text.toString());
                  sp.setBool('isLogin', true);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
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

import 'package:design1/utils/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Email',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: passController,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            ElevatedButton(
              child: Text('Login'),
              onPressed: () {
                loginUser(emailController.text, passController.text);
              },
            ),
            ElevatedButton(
              child: Text('Register'),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            )
          ],
        ),
      ),
    );
  }

  User? userModel;
  Future loginUser(String email, String pass) async {
    var response = await Dio().get('${Constants.BASE_URL}userLogin.php', queryParameters: {
      'email': email,
      'password': pass,
    });

    userModel = User.fromJson(response.data);
    if (userModel!.message == 'User Logged in successfully') {
      globalUserModel = userModel;

      Navigator.pushNamed(context, '/homee');
    } else {
      var snackBar = SnackBar(
        content: Text(userModel!.message!),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

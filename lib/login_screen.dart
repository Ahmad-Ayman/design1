import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            controller: email,
          ),
          TextFormField(
            controller: pass,
          ),
          ElevatedButton(
              onPressed: () {
                loginUser(email.text, pass.text);
              },
              child: Text('Login'))
        ],
      ),
    );
  }

  Future loginUser(email, pass) async {
    var response = await Dio().post('https://api.storerestapi.com/auth/login', data: {
      'email': email,
      'password': pass,
    });
    print(response.data['message']);
  }

  Future register(email, pass) async {
    var response = await Dio().post('https://api.storerestapi.com/auth/register', data: {
      'name': 'Ahmed',
      'email': email,
      'number': 5632,
      'password': pass,
      'password_repeat': pass,
    });
    print(response.data['message']);
  }
}

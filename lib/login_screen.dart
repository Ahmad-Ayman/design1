import 'dart:convert';

import 'package:design1/models/user_model.dart';
import 'package:design1/utils/config.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usertNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: firstNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'First  Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: lastNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Last  Name',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: usertNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User  Name',
                ),
              ),
            ),
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
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextFormField(
                controller: addressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
            ),
            ElevatedButton(
              child: Text('register'),
              onPressed: () {
                registerNewUser(firstNameController.text, lastNameController.text, usertNameController.text, emailController.text,
                    phoneController.text, addressController.text, passController.text);
              },
            ),
            ElevatedButton(
              child: Text('Login Page'),
              onPressed: () {
                Navigator.pushNamed(context, '/LoginPage2');
              },
            )
          ],
        ),
      ),
    );
  }

  User? userModelObject;
  Future registerNewUser(String fname, String lname, String uname, String email, String phone, String address, String pass) async {
    var url = Uri.parse(
        "${Constants.BASE_URL}userRegister.php?first_name=$fname&last_name=$lname&user_name=$uname&user_email=$email&user_password=$pass&user_phone=$phone&address=$address");
    print(url);
    var response = await http.get(url);
    userModelObject = User.fromJson(jsonDecode(response.body));
    if (userModelObject!.message == "User Registered Successfully") {
      /// NAvigate to home
      print("navigate to home");
    } else {
      // Toast
      var snackBar = SnackBar(
        content: Text(userModelObject!.message!),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

    globalUserModel = userModelObject;

    print(userModelObject!.message);
    Navigator.pushNamed(context, '/homee');
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

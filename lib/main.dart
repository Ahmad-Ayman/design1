import 'package:design1/screens/hommm.dart';
import 'package:design1/screens/login_page.dart';
import 'package:design1/screens/page_for_bottom_navigation.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'screens/page_for_drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      initialRoute: '/navDrawer',
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginScreen(),
        '/login': (context) => LoginScreen(),
        '/LoginPage2': (context) => LoginPage(),
        '/homee': (context) => Homee(),
        '/navBar': (context) => PageForNav(),
        '/navDrawer': (context) => PageForDrawer(),
      },
    );
  }
}

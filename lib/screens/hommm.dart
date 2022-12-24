import 'package:design1/utils/config.dart';
import 'package:flutter/material.dart';

class Homee extends StatefulWidget {
  const Homee({Key? key}) : super(key: key);

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(globalUserModel!.userData!.userName!),
      ),
    );
  }
}

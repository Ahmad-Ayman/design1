import 'package:flutter/material.dart';

class Two extends StatefulWidget {
  const Two({Key? key}) : super(key: key);

  @override
  State<Two> createState() => _TwoState();
}

class _TwoState extends State<Two> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.redAccent,
      child: Center(
        child: Text('Two', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

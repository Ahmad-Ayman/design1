import 'package:flutter/material.dart';

class Three extends StatefulWidget {
  const Three({Key? key}) : super(key: key);

  @override
  State<Three> createState() => _ThreeState();
}

class _ThreeState extends State<Three> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.deepPurpleAccent,
      child: Center(
        child: Text(
          'Three',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

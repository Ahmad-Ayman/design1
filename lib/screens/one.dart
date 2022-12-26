import 'package:flutter/material.dart';

class One extends StatefulWidget {
  const One({Key? key}) : super(key: key);

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.brown,
      child: Center(
        child: Text('One', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}

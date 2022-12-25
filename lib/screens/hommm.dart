import 'package:design1/screens/three.dart';
import 'package:flutter/material.dart';

import 'one.dart';
import 'two.dart';

class Homee extends StatefulWidget {
  const Homee({Key? key}) : super(key: key);

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: 100,
          child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.amber,
                      width: 100,
                      child: Row(
                        children: [
                          Icon(Icons.ac_unit),
                          Text('Page $index'),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        Expanded(child: pageScreen())
      ],
    ));
  }

  Widget pageScreen() {
    switch (currentPage) {
      case 0:
        return One();
      case 1:
        return Two();
      default:
        return Three();
    }
  }
}

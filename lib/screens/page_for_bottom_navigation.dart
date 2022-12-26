import 'package:design1/screens/one.dart';
import 'package:design1/screens/three.dart';
import 'package:design1/screens/two.dart';
import 'package:flutter/material.dart';

class PageForNav extends StatefulWidget {
  const PageForNav({Key? key}) : super(key: key);

  @override
  State<PageForNav> createState() => _PageForNavState();
}

class _PageForNavState extends State<PageForNav> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedItemFromNavBar(),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget selectedItemFromNavBar() {
    switch (_selectedIndex) {
      case 0:
        return One();
      case 1:
        return Two();
      default:
        return Three();
    }
  }
}

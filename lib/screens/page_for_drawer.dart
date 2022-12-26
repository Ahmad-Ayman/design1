import 'package:design1/screens/three.dart';
import 'package:design1/screens/two.dart';
import 'package:flutter/material.dart';

import 'one.dart';

class PageForDrawer extends StatefulWidget {
  const PageForDrawer({Key? key}) : super(key: key);

  @override
  State<PageForDrawer> createState() => _PageForDrawerState();
}

class _PageForDrawerState extends State<PageForDrawer> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: selectedItemFromNavBar(),
        drawer: // Add a ListView to the drawer. This ensures the user can scroll
            // through the options in the drawer if there isn't enough vertical
            // space to fit everything.
            Drawer(
                child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              selected: _selectedIndex == 0,
              selectedTileColor: _selectedIndex == 0 ? Colors.grey.shade300 : Colors.transparent,
              selectedColor: _selectedIndex == 0 ? Colors.blue : Colors.black,
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              selected: _selectedIndex == 1,
              selectedTileColor: _selectedIndex == 1 ? Colors.grey.shade300 : Colors.transparent,
              selectedColor: _selectedIndex == 1 ? Colors.blue : Colors.black,
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              selected: _selectedIndex == 2,
              selectedTileColor: _selectedIndex == 2 ? Colors.grey.shade300 : Colors.transparent,
              selectedColor: _selectedIndex == 2 ? Colors.blue : Colors.black,
              title: const Text('Item 3'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        )));
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

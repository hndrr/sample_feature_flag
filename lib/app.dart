import 'package:flutter/material.dart';

import 'about/about_page.dart';
import 'store/store_list.dart';

// ignore: use_key_in_widget_constructors
class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _widgetList = <Widget>[
      const StoreListPage(),
      const AboutPage(),
      const AboutPage(),
    ];

    return MaterialApp(
      home: Scaffold(
        body: _widgetList.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.store_mall_directory), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_search_rounded), label: 'About'),
            BottomNavigationBarItem(icon: Icon(Icons.mail), label: 'Contact'),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.blueAccent,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}

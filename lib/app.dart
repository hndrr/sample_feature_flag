import 'package:flutter/material.dart';

import 'about/about_page.dart';
import 'contact/contact_page.dart';
import 'domain/remote_config_repository.dart';
import 'store/store_list.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  RemoteConfigRepository remoteConfig = RemoteConfigRepository();
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
    RemoteConfigRepository.featInvisibleStoreTab;

    final _widgetList = <Widget>[
      if (RemoteConfigRepository.featInvisibleStoreTab == false)
        const StoreListPage(),
      const AboutPage(),
      const ContactPage(),
    ];

    return MaterialApp(
      home: Scaffold(
        body: _widgetList.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            if (RemoteConfigRepository.featInvisibleStoreTab == false)
              const BottomNavigationBarItem(
                  icon: Icon(Icons.store_mall_directory), label: 'Home'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: 'About'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.mail), label: 'Contact'),
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

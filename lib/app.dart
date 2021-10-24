import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'about/about_page.dart';
import 'contact/contact_page.dart';
import 'domain/get_it_service.dart';
import 'domain/remote_config_repository.dart';
import 'store/store_list.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  RemoteConfigRepository remoteConfig = getIt<RemoteConfigRepository>();
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
    const Locale locale = Locale('ja', 'JP');

    final _widgetList = <Widget>[
      const StoreListPage(),
      if (remoteConfig.featInvisibleTab == false) const AboutPage(),
      const ContactPage(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      locale: locale,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        locale,
      ],
      home: Scaffold(
        body: _widgetList.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
                icon: Icon(Icons.store_mall_directory), label: 'Home'),
            if (remoteConfig.featInvisibleTab == false)
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

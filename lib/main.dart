import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'about/about_model.dart';
import 'app.dart';
import 'contact/contact_model.dart';
import 'domain/remote_config_repository.dart';
import 'store/store_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await RemoteConfigRepository.init();

  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<StoreModel>(
          create: (BuildContext context) => StoreModel(),
        ),
        ChangeNotifierProvider<AboutModel>(
          create: (BuildContext context) => AboutModel(),
        ),
        ChangeNotifierProvider<ContactModel>(
          create: (BuildContext context) => ContactModel(),
        ),
      ],
      child: const App(),
    ),
  );
}

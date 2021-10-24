import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigRepository {
  // static RemoteConfigRepository? master;
  // RemoteConfigRepository();
  static bool? featInvisibleStoreTab;
  static String? featAboutText;
  static List<Map<String, dynamic>>? featHiddenItem;

  // Initialize
  static Future<void> init() async {
    // master = RemoteConfigRepository();
    final remoteConfig = RemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      minimumFetchInterval: const Duration(hours: 1),
    ));

    // デフォルトの値
    await remoteConfig.setDefaults(<String, dynamic>{
      'feat_about_text': 'default welcome',
      'feat_disable_purchase': false,
    });

    await remoteConfig.fetchAndActivate();
    // bool
    featInvisibleStoreTab = remoteConfig.getBool('feat_invisible_store_tab');
    // String
    featAboutText = remoteConfig.getString('feat_about_text');
    // Json
    featHiddenItem = jsonDecode(remoteConfig.getString('feat_hidden_item'))
        .cast<Map<String, dynamic>>();
  }
}

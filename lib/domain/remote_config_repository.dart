import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigRepository {
  static RemoteConfigRepository? value;
  bool? featInvisibleStoreTab;
  String? featAboutText;
  List<Map<String, dynamic>>? featHiddenItem;

  // Initialize
  static Future<void> init() async {
    value = RemoteConfigRepository();
    final remoteConfig = RemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      // 再取得のデフォルト値は12時間
      minimumFetchInterval: const Duration(minutes: 1),
    ));

    // デフォルトの値
    await remoteConfig.setDefaults(<String, dynamic>{
      'feat_about_text': 'default welcome',
      'feat_disable_purchase': false,
      'feat_hidden_item': json.encode([{}]),
    });

    await remoteConfig.fetchAndActivate();
    // bool
    value!.featInvisibleStoreTab =
        remoteConfig.getBool('feat_invisible_store_tab');
    // String
    value!.featAboutText = remoteConfig.getString('feat_about_text');
    // Json
    value!.featHiddenItem =
        jsonDecode(remoteConfig.getString('feat_hidden_item'))
            .cast<Map<String, dynamic>>();
  }
}

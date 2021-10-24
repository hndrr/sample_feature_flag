import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigRepository {
  static RemoteConfigRepository? value;
  bool? featInvisibleTab;
  String? featMailText;
  String? featDisablePurchase;
  List<Map<String, dynamic>>? featHiddenItem;
  List<Map<String, dynamic>>? featAddItem;

  // Initialize
  static Future<void> init() async {
    value = RemoteConfigRepository();
    final remoteConfig = RemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      // 再取得のデフォルト値は12時間
      minimumFetchInterval: const Duration(milliseconds: 30),
    ));

    // アプリ内デフォルト値
    await remoteConfig.setDefaults(<String, dynamic>{
      'feat_mail_text': 'hoge@hoge.com',
      'feat_disable_purchase': false,
      'feat_hidden_item': json.encode([{}]),
      'featAddItem': json.encode([{}]),
    });
    // remoteconfigからのfetchとactivateを行う
    await remoteConfig.fetchAndActivate();
    // bool
    value!.featInvisibleTab = remoteConfig.getBool('feat_invisible_tab');
    // String
    value!.featMailText = remoteConfig.getString('feat_mail_text');

    value!.featDisablePurchase =
        remoteConfig.getString('feat_disable_purchase');
    // Json
    value!.featHiddenItem =
        jsonDecode(remoteConfig.getString('feat_hidden_item'))
            .cast<Map<String, dynamic>>();

    value!.featAddItem = jsonDecode(remoteConfig.getString('feat_add_item'))
        .cast<Map<String, dynamic>>();
  }
}

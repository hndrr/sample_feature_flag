import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigRepository {
  RemoteConfigRepository();
  bool? featIsHiddenTab;
  int? featPriceInt;
  String? featMailText;
  String? featDisablePurchaseId;
  List<Map<String, dynamic>>? featHiddenItem;
  List<Map<String, dynamic>>? featAddItem;

  // Initialize
  Future<void> init() async {
    final remoteConfig = RemoteConfig.instance;
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 10),
      // 再取得のデフォルト値は12時間
      minimumFetchInterval: const Duration(milliseconds: 30),
    ));

    // アプリ内デフォルト値
    await remoteConfig.setDefaults(<String, dynamic>{
      'feat_mail_text': 'hoge@hoge.com',
      'feat_disable_purchase_id': false,
      'feat_hidden_item': json.encode([{}]),
      'feat_add_item': json.encode([{}]),
    });
    // remoteconfigからのfetchとactivateを行う
    await remoteConfig.fetchAndActivate();

    // bool
    featIsHiddenTab = remoteConfig.getBool('feat_isHidden_tab');
    // int デフォルト値は0
    featPriceInt = remoteConfig.getInt('feat_price_int');
    // String
    featMailText = remoteConfig.getString('feat_mail_text');
    featDisablePurchaseId = remoteConfig.getString('feat_disable_purchase_id');
    // JSON
    featHiddenItem = jsonDecode(remoteConfig.getString('feat_hidden_item'))
        .cast<Map<String, dynamic>>();

    featAddItem = jsonDecode(remoteConfig.getString('feat_add_item'))
        .cast<Map<String, dynamic>>();
  }
}

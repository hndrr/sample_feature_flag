import 'package:flutter/material.dart';
import 'package:sample_feature_flag/domain/get_it_service.dart';
import 'package:sample_feature_flag/domain/item_list.dart';
import 'package:sample_feature_flag/domain/remote_config_repository.dart';

class StoreModel extends ChangeNotifier {
  static RemoteConfigRepository remoteConfig = getIt<RemoteConfigRepository>();

  bool isLoading = false;
  bool isPlaying = false;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void endLoading() {
    isLoading = false;
    notifyListeners();
  }

  bool _firstLaunch = true;
  bool get firstLaunch => _firstLaunch;

  set firstLaunch(bool val) {
    _firstLaunch = val;
    notifyListeners();
  }

  static List<Map<String, dynamic>> jsonItemList = [
    {'id': '1a', 'emoji': '💻', 'title': 'Macbook Pro', 'price': '240000'},
    {'id': '1b', 'emoji': '🎮', 'title': 'Switch', 'price': '38000'},
    {'id': '1c', 'emoji': '💿', 'title': 'CD', 'price': '3000'},
    {'id': '1d', 'emoji': '🍛', 'title': 'カレー', 'price': '800'},
    {'id': '1e', 'emoji': '🍣', 'title': '寿司', 'price': '4000'},
    {'id': '1f', 'emoji': '🍜', 'title': 'ラーメン', 'price': '1000'},
    {'id': '1g', 'emoji': '🍔', 'title': 'ハンバーガー', 'price': '300'},
    {'id': '1h', 'emoji': '🥩', 'title': '肉', 'price': '4000'},
    {'id': '1i', 'emoji': '🐟', 'title': '魚', 'price': '300'},
    {'id': '1j', 'emoji': '😄', 'title': 'スマイル', 'price': '0'},
  ];

  // RemoteConfigのJson
  // [{"id":"09","emoji":"💩","title":"うんち","price":"10000","visible":false}]
  static List<Map<String, dynamic>> featAddItem = remoteConfig.featAddItem!;

  final List<Item> itemList = (jsonItemList + featAddItem)
      .map((item) => Item(
            item['id']!,
            item['emoji']!,
            item['title']!,
            int.parse(item['price']!),
          ))
      // RemoteConfigのJsonで指定したものを非表示
      // [{"id":"1c"},{"id":"1d","emoji":"🍛","title": "カレー"}]
      .where((item) => item.id != remoteConfig.featHiddenItem![0]["id"])
      .where((item) => item.emoji != remoteConfig.featHiddenItem![1]["emoji"])
      .toList();
}

import 'package:flutter/material.dart';
import 'package:sample_feature_flag/domain/item_list.dart';
import 'package:sample_feature_flag/domain/remote_config_repository.dart';

class StoreModel extends ChangeNotifier {
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

  static List<Map<String, dynamic>> jsonItemList = [
    {'id': '1a', 'emoji': '💻', 'title': 'Macbook Pro', 'price': '240000'},
    {'id': '1b', 'emoji': '🎮', 'title': 'Switch', 'price': '40000'},
    {'id': '1c', 'emoji': '💿', 'title': 'CD', 'price': '3000'},
    {'id': '1d', 'emoji': '🍛', 'title': 'カレー', 'price': '800'},
    {'id': '1e', 'emoji': '🍣', 'title': '寿司', 'price': '4000'},
    {'id': '1f', 'emoji': '🍜', 'title': 'ラーメン', 'price': '1000'},
    {'id': '1g', 'emoji': '🍔', 'title': 'ハンバーガー', 'price': '300'},
    {'id': '1h', 'emoji': '🥩', 'title': '肉', 'price': '4000'},
    {'id': '1i', 'emoji': '😄', 'title': 'スマイル', 'price': '0'},
  ];

  // RemoteConfigのJsonから合成
  // static List<Map<String, dynamic>> featAddItem =
  //     RemoteConfigRepository.value!.featAddItem!;
  // static List<Map<String, dynamic>> jsonItemListPlusfeatAddItem =
  //     jsonItemList + featAddItem;

  final List<Item> itemList = jsonItemList
      .map((item) => Item(
            item['id']!,
            item['emoji']!,
            item['title']!,
            int.parse(item['price']!),
          ))
      // RemoteConfigのJsonで指定したものを非表示
      // .where((item) =>
      //     item.id != RemoteConfigRepository.value!.featHiddenItem![0]["id"])
      // .where((item) =>
      //     item.emoji !=
      //     RemoteConfigRepository.value!.featHiddenItem![1]["emoji"])
      .toList();
}

import 'package:flutter/material.dart';
import 'package:sample_feature_flag/domain/item_list.dart';

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
    {'emoji': '💻', 'title': 'Macbook Pro', 'price': '240000'},
    {'emoji': '🎮', 'title': 'Switch', 'price': '40000'},
    {'emoji': '💿', 'title': 'CD', 'price': '3000'},
    {'emoji': '🍛', 'title': 'カレー', 'price': '800'},
    {'emoji': '🍣', 'title': '寿司', 'price': '4000'},
    {'emoji': '🍜', 'title': 'ラーメン', 'price': '1000'},
    {'emoji': '🍔', 'title': 'ハンバーガー', 'price': '300'},
    {'emoji': '🥩', 'title': '肉', 'price': '4000'},
    {'emoji': '😄', 'title': 'スマイル', 'price': '0'},
    {'emoji': '💩', 'title': 'うんち', 'price': '10000'},
  ];

  final List<Item> itemList = jsonItemList
      .map((item) => Item(
            item['emoji']!,
            item['title']!,
            int.parse(item['price']!),
          ))
      .toList();
}

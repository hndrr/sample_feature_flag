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
    {'id': '00', 'emoji': '💻', 'title': 'Macbook Pro', 'price': '240000'},
    {'id': '01', 'emoji': '🎮', 'title': 'Switch', 'price': '40000'},
    {'id': '02', 'emoji': '💿', 'title': 'CD', 'price': '3000'},
    {'id': '03', 'emoji': '🍛', 'title': 'カレー', 'price': '800'},
    {'id': '04', 'emoji': '🍣', 'title': '寿司', 'price': '4000'},
    {'id': '05', 'emoji': '🍜', 'title': 'ラーメン', 'price': '1000'},
    {'id': '06', 'emoji': '🍔', 'title': 'ハンバーガー', 'price': '300'},
    {'id': '07', 'emoji': '🥩', 'title': '肉', 'price': '4000'},
    {'id': '08', 'emoji': '😄', 'title': 'スマイル', 'price': '0'},
    {'id': '09', 'emoji': '💩', 'title': 'うんち', 'price': '10000'},
  ];

  final List<Item> itemList = jsonItemList
      .map((item) => Item(
            item['id']!,
            item['emoji']!,
            item['title']!,
            int.parse(item['price']!),
          ))
      .toList();
}

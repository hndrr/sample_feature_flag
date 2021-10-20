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

  static List<Map<String, String>> jsonItemList = [
    {'emoji': '💩', 'title': 'うんち', 'desc': 'できたてです'},
    {'emoji': '🙇', 'title': 'おじぎ', 'desc': 'Close'},
    {'emoji': '🙇', 'title': 'おじぎ', 'desc': 'Close'},
    {'emoji': '💩', 'title': 'うんち', 'desc': 'できたてです'},
    {'emoji': '🙇', 'title': 'おじぎ', 'desc': 'Close'},
    {'emoji': '🙇', 'title': 'おじぎ', 'desc': 'Close'},
    {'emoji': '🙇', 'title': 'おじぎ', 'desc': 'Close'},
    {'emoji': '💩', 'title': 'うんち', 'desc': 'できたてです'},
    {'emoji': '🙇', 'title': 'おじぎ', 'desc': 'Close'},
    {'emoji': '🙇', 'title': 'おじぎ', 'desc': 'Close'},
  ];

  final List<Item> itemList = jsonItemList
      .map((item) => Item(
            item['emoji']!,
            item['title']!,
            item['desc']!,
          ))
      .toList();
}

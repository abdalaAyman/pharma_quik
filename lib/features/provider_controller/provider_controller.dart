import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteProvider with ChangeNotifier {
  Box<String> _favoritesBox = Hive.box<String>('favorites');

  List<String> get favorites {
    return _favoritesBox.values.toList();
  }

  void addFavorite(String item) {
    _favoritesBox.add(item);
    notifyListeners();
  }

  void removeFavorite(int index) {
    _favoritesBox.deleteAt(index);
    notifyListeners();
  }
}

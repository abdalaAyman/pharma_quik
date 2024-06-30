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

class AlarmProvider with ChangeNotifier {
  Box<String> _AlarmBox = Hive.box<String>('alarm');

  List<String> get alarms {
    return _AlarmBox.values.toList();
  }

  void addAlarm(String item) {
    _AlarmBox.add(item);
    notifyListeners();
  }

  void removeAlarm(int index) {
    _AlarmBox.deleteAt(index);
    notifyListeners();
  }
}

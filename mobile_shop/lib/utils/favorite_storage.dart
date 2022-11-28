import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class FavoriteStorage {
  final Future<SharedPreferences> _storage = SharedPreferences.getInstance();
  final String _key = "favorites";

  Future<void> setFavorites(List<int> favorites) async {
    SharedPreferences pref = await _storage;
    await pref.setString(_key, jsonEncode(favorites));
  }

  Future<List<int>> getFavorites() async {
    SharedPreferences pref = await _storage;
    final String? favoriteString = pref.getString(_key);
    if (favoriteString == null) {
      return [];
    }
    List<dynamic> list = jsonDecode(favoriteString);
    return list.cast<int>();
    
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PrefernceKey {
  static const permisson = 'permisson';
  static const adpopup = 'adpopup';
}

final preferenceItemProvider =
    StateNotifierProvider<PreferenceItemNotifer, Map<String, bool>>((ref) {
  return PreferenceItemNotifer()..loadFromSharedPreferences();
});

class PreferenceItemNotifer extends StateNotifier<Map<String, bool>> {
  PreferenceItemNotifer() : super({});

  bool getPreferenceValue(String key) {
    return state[key] ?? false;
  }

  void setPreferenceItem(String key, bool isSkip) {
    state = {...state, key: isSkip};
    saveToSharedPreferences();
  }

  void removePreferenceItem(String key) {
    state = Map.from(state)..remove(key);
    saveToSharedPreferences();
  }

  Future<void> loadFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String? itemValue = prefs.getString('preferences');
    if (itemValue != null) {
      Map<String, dynamic> json = jsonDecode(itemValue);
      state = json.map((key, value) => MapEntry(key, value as bool));
    }
  }

  Future<void> saveToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String itemValue = jsonEncode(state);
    await prefs.setString('preferences', itemValue);
  }
}

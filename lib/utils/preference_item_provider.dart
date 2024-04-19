import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class PrefernceKey {
  static const permisson = 'permisson';
  static const adpopup = 'adpopup';
  static const dongLocation = 'dongLocation';
  static const position = 'position';
}

enum PrefernceKeys {
  permisson,
  adpopup;

  Map<String, dynamic> toJson() => {
        'permisson': '',
        'adpopup': '',
      };
}

final preferenceItemProvider =
    StateNotifierProvider<PreferenceItemNotifer, Map<String, dynamic>>((ref) {
  return PreferenceItemNotifer()..loadFromSharedPreferences();
});

class PreferenceItemNotifer extends StateNotifier<Map<String, dynamic>> {
  PreferenceItemNotifer() : super({});

  bool getBoolPreferenceValue(String key) {
    return state[key] ?? false;
  }

  int getIntPreferenceValue(String key) {
    return state[key] ?? 0;
  }

  double getDoublePreferenceValue(String key) {
    return state[key] ?? 0;
  }

  String getStringPreferenceValue(String key) {
    return state[key] ?? '';
  }

  void setPreferenceItem(String key, dynamic value) {
    state = {...state, key: value};
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
      state = json.map((key, value) => MapEntry(key, value));
    }
  }

  Future<void> saveToSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    String itemValue = jsonEncode(state);
    await prefs.setString('preferences', itemValue);
  }
}

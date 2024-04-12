import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchStateProvider =
    StateNotifierProvider<SearchNotifier, List<SearchItem>>((ref) {
  return SearchNotifier();
});

class SearchItem {
  String keyword;
  String date;

  SearchItem({required this.keyword, required this.date});

  @override
  String toString() => '$keyword,$date';

  factory SearchItem.fromString(String str) {
    final parts = str.split(',');
    return SearchItem(keyword: parts[0], date: parts[1]);
  }
}

class SearchNotifier extends StateNotifier<List<SearchItem>> {
  SearchNotifier() : super([]) {
    _loadSearch();
  }

  Future<void> _loadSearch() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final searchData = prefs.getStringList('searchData') ?? [];
    state = searchData.map((e) => SearchItem.fromString(e)).toList();
  }

  void saveSearch(String keyword) async {
    final currentDate = DateFormat('MM.dd').format(DateTime.now());
    final newSearchItem = SearchItem(keyword: keyword, date: currentDate);
    final existingIndex = state.indexWhere((item) => item.keyword == keyword);

    if (existingIndex != -1) {
      state[existingIndex].date = currentDate;
    } else {
      state.add(newSearchItem);
    }

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'searchData',
      state.map((e) => e.toString()).toList(),
    );

    state = List.from(state);
  }
}

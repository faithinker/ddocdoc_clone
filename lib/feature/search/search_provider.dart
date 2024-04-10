
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchStateProvider =
    StateNotifierProvider<SearchNotifier, AsyncValue<SearchState>>((ref) {
  return SearchNotifier(ref);
});

class SearchState {
  final String searchTerm;
  final String searchDate;

  SearchState(this.searchTerm, this.searchDate);
}

class SearchNotifier extends StateNotifier<AsyncValue<SearchState>> {
  final Ref _ref;

  SearchNotifier(this._ref) : super(const AsyncValue.loading()) {
    _loadSearch();
  }

  Future<void> _loadSearch() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String searchTerm = prefs.getString('search_term') ?? '';
      String searchDate = prefs.getString('search_date') ?? '';

      state = AsyncValue.data(SearchState(searchTerm, searchDate));
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> _saveSearch(String term, String date) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('search_term', term);
      await prefs.setString('search_date', date);

      state = AsyncValue.data(SearchState(term, date));
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  void updateSearchTerm(String term) async {
    final currentState = state.value;
    if (currentState != null) {
      state = AsyncValue.data(SearchState(term, currentState.searchDate));
    }
  }

  void onSearch() async {
    final currentState = state.value;
    if (currentState != null) {
      String searchTerm = currentState.searchTerm.trim();
      DateTime now = DateTime.now();
      String formattedDate = DateFormat('yyyy-MM-dd').format(now);

      if (searchTerm.isNotEmpty) {
        await _saveSearch(searchTerm, formattedDate);
      }
    }
  }
}

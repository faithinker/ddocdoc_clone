import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../search_provider.dart';

class SearchTextField extends ConsumerWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: '증상 또는 병원을 검색해보세요.',
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.4),
          fontSize: 18,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.0),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
      ),
      onSubmitted: (value) {
        ref.read(searchStateProvider.notifier).saveSearch(value);
      },
    );
  }
}

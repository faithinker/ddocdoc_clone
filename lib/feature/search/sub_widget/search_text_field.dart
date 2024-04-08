import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  String? keyword;

  SearchTextField({super.key, this.keyword});

  @override
  Widget build(BuildContext context) {
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
      onChanged: (value) {
        print('Search query: $value');
      },
    );
  }
}

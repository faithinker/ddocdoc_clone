import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black.withOpacity(0.07),
          prefixIcon: const Icon(Icons.search),
          hintText: '질병, 진료과, 병원을 검색해보세요.',
          hintStyle: TextStyle(
            color: Colors.black.withOpacity(0.3),
            fontSize: 15,
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
      ),
    );
  }
}

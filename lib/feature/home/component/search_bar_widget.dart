import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  // TODO: TextField 대신 Container로 변경
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.07),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 8.0, right: 8.0),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: Text(
              '질병, 진료과, 병원을 검색해보세요.',
              style: TextStyle(
                color: Colors.black.withOpacity(0.3),
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

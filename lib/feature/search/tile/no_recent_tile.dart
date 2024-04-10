import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NoRecentTile extends StatelessWidget {
  const NoRecentTile({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Center(
        child: Text(
          '최근 검색어가 없습니다.',
          style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.5)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigation extends StatelessWidget {
  final String title;

  const CustomNavigation({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        const Spacer(),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(width: 30),
        const Spacer(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PermissonData {
  final IconData icon;
  final String title;
  final String subtitle;

  PermissonData({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class PermissionTile extends StatelessWidget {
  final PermissonData data;

  const PermissionTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(data.icon, size: 30),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(
                data.title,
                softWrap: true,
                style: const TextStyle(fontSize: 13),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  data.subtitle,
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 13, color: Colors.black.withOpacity(0.3)),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}

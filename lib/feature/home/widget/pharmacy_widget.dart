import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../pharmacy_map/pharmacy_map_screen.dart';
import '../../../utils/router_key.dart';

class PharmacyWidget extends StatelessWidget {
  const PharmacyWidget({
    super.key,
    required this.imageWidth,
  });

  final double imageWidth;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(RouterKey.pharmacyMap);
      },
      child: Container(
        width: imageWidth,
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.05),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.piano,
                  size: 40,
                ),
                const SizedBox(width: 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '내 주변 약국 찾기',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      '지도에서 내 주변 약국을 확인해보세요.',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black.withOpacity(0.4),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}


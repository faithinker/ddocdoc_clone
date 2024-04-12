import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash/flash.dart';
import 'package:flash/flash_helper.dart';
import '../../component/custom_button.dart';
import 'sub_widget/search_text_field.dart';
import 'sub_widget/search_scroll_screen.dart';
import 'package:go_router/go_router.dart';
class SearchScreen extends ConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              child: const Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                              ),
                              onTap: () {
                                GoRouter.of(context).pop();
                              },
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: SearchTextField(),
                            ),
                            const Icon(Icons.search),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            CustomButton(
                                text: '가산동',
                                icon: Icons.my_location_outlined,
                                backgroundColor: Colors.black.withOpacity(0.05),
                                frontColor: Colors.black.withOpacity(0.6),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.1),
                                    width: 1),
                                edge: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                corner: 8,
                                onTap: () {}),
                            const SizedBox(width: 10),
                            CustomButton(
                                text: '진료과목',
                                icon: Icons.local_hospital_outlined,
                                backgroundColor: Colors.black.withOpacity(0.05),
                                frontColor: Colors.black.withOpacity(0.7),
                                border: Border.all(
                                    color: Colors.grey.withOpacity(0.1),
                                    width: 1),
                                edge: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                corner: 8,
                                onTap: () {}),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Divider(thickness: 2, color: Colors.black.withOpacity(0.035)),
                ],
              ),
            ),
            Expanded(child: SearchScrollScreen()),
          ],
        ),
      ),
    );
  }
}


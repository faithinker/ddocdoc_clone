import 'package:ddocdoc_clone/feature/my_ddocdoc/my_ddocdoc_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../feature/home/home_screen.dart';
import '../../feature/home/home_screen.dart';
import '../../feature/my_page/my_page_screen.dart';
import '../../feature/community/community_screen.dart';

final tabIndexProvider = StateProvider((ref) => 0);

// class _TabScreenState extends State<TabScreen> {
class TabScreen extends ConsumerWidget {
  final List<Widget> _pages = [
    const HomeScreen(),
    // const PlaceholderWidget(color: Colors.green, text: 'Tab 2'),
    const MyDdocDocScreen(),
    const ProviderScope(child: CommunityScreen()),
    MyPageScreen(), //PlaceholderWidget(color: Colors.yellow, text: 'Tab 4'),
  ];

  TabScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabIndexRead = ref.watch(tabIndexProvider.notifier);
    final tabIndexState = ref.watch(tabIndexProvider);

    return Scaffold(
      body: _pages[tabIndexState],
      bottomNavigationBar: Consumer(builder: (context, watch, child) {
        // ? iOS TabBarController처럼 - 대시라인으로 구분되도록 UI 변경 MaterialApp을 CupertinoApp으로 바꿔야 할수도?...
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color.fromARGB(255, 68, 68, 68),
          unselectedItemColor: Colors.grey,
          selectedFontSize: 12.0,
          unselectedFontSize: 12.0,
          backgroundColor: Colors.white70,
          unselectedLabelStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 13.0,
          ),
          showUnselectedLabels: true,
          currentIndex: tabIndexState,
          onTap: (index) {
            tabIndexRead.state = index;
          },
          items: [
            BottomBarItem(icon: Icons.home, label: '홈'),
            BottomBarItem(icon: Icons.article_outlined, label: '나의 똑닥'),
            BottomBarItem(icon: Icons.people_outline, label: '커뮤니티'),
            BottomBarItem(icon: Icons.person_outline, label: '마이페이지'),
          ],
        );
      }),
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;
  final String text;

  const PlaceholderWidget({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}

class BottomBarItem extends BottomNavigationBarItem {
  BottomBarItem({
    required IconData icon,
    required String label,
  }) : super(
          icon: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Icon(icon),
              const SizedBox(
                height: 5,
              ),
              Text(label)
            ],
          ),
          label: '',
        );
}

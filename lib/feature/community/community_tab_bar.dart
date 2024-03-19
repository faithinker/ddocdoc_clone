import 'package:flutter/material.dart';

class CommunityTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabList;

  const CommunityTabBar({
    required Key key,
    required this.tabController,
    required this.tabList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey,
      labelStyle: const TextStyle(
        fontSize: 16,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 16,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorColor: Colors.black,
      overlayColor: const MaterialStatePropertyAll(
        Colors.transparent,
      ),
      labelPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 5,
      ),
      // !!!: isScroll 때문에 처음과 끝에 margin 원치 않는 마진값이 생긴다.
      // 대신에 이걸 적용해야 라벨 사이즈 만큼 탭 크기가 늘어난다. => 특정 방법을 찾거나 Custom Tab을 그려야 한다.
      isScrollable: true,

      onTap: (index) {},
      tabs: tabList.map((e) => Tab(text: e)).toList(),
    );
  }
}

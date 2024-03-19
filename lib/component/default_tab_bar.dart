import 'package:flutter/material.dart';

class DefaultTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabList;

  const DefaultTabBar({
    required Key key,
    required this.tabController,
    required this.tabList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      controller: tabController,
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
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
      onTap: (index) {},
      tabs: tabList.map((e) => Tab(text: e)).toList(),
    );
  }
}
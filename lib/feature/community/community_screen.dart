import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../component/bottom_button.dart';
import '../../component/t_header.dart';
import '../../feature/community/community_tile.dart';
import '../../utils/router_key.dart';
import 'community_tab_bar.dart';
import '../../utils/resources.dart';

/*
TODO: 공통 탑 헤더 파일 별도 분리 하기? 
=> 나의 똑닥, 커뮤니티, 마이페이지 전부 같은 공통헤더 같으나
스크롤 할때도 체킹 필요, 마이페이지는 iOS NavigationController에서 제공하는 기능으로 구현한듯?
*/

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  _CommunityScreen createState() => _CommunityScreen();
}

class _CommunityScreen extends State<CommunityScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController = TabController(
    length: R.communityTabList.length,
    vsync: this,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 500),
  );

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, watch, child) {
      return SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: const THeader(),
            ),
            CommunityTabBar(
              key: const ValueKey('communityTab'),
              tabController: tabController,
              tabList: R.communityTabList,
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(RouterKey.writeDetail('ss'));
                },
                child: const CommunityTile(),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.only(end: 20),
              child: BottomButton(
                onTap: () {
                  GoRouter.of(context).push(RouterKey.write);
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}

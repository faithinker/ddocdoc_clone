import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../component/bottom_button.dart';
import '../../component/t_header.dart';
import 'community_tab_bar.dart';

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
  final _tabList = ["전체", "아이가 아파요", "아토피맘 공감", "성장발달 고민", "육아•일상", "이벤트"];

  late TabController tabController = TabController(
    length: _tabList.length,
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
              tabList: _tabList,
            ),
            const SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CommunityTile(),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(end: 20),
              child: BottomButton(),
            ),
          ],
        ),
      );
    });
  }
}

class CommunityTile extends StatelessWidget {
  const CommunityTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      //alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 35,
            height: 20,
            decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(Radius.circular(3)),
              //border: Border.all(color: Colors.blue, width: 1.0),
            ),
            child: const Center(
              child: Text(
                '공지',
                style: TextStyle(fontSize: 11.0),
              ),
            ),
          ),
          const SizedBox(height: 3),
          const Text(
            '똑닥이 가져온 좋은 소식 3가지',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 3),
          Text(
            '접수할 때, 체크할 게 하나 줄었어요!> 고유식...',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.normal,
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '2주 전•좋아요 31•댓글 28',
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          const SizedBox(height: 10),
          Divider(
            thickness: 1.0,
            color: Colors.black.withOpacity(0.2),
          ),
        ],
      ),
    );
  }
}

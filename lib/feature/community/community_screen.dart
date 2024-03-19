import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  void initState() {
    super.initState();
  }

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
            CustomTabBar(
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
              child: WriteButton(),
            ),
          ],
        ),
      );
    });
  }
}

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabList;

  const CustomTabBar({
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

class WriteButton extends StatelessWidget {
  const WriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 110,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius:
              BorderRadius.circular(30), // Half of the height for an ellipse
          color: Colors.yellow,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, -2),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_sharp,
              color: Colors.black.withOpacity(0.5),
            ),
            const SizedBox(width: 3),
            const Text(
              '글쓰기',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class THeader extends StatelessWidget {
  const THeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '커뮤니티',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                //
              },
              child: Icon(
                Icons.search,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () {
                //
              },
              child: Icon(
                Icons.notifications_outlined,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(width: 15),
            GestureDetector(
              onTap: () {
                //
              },
              child: Icon(
                Icons.sentiment_dissatisfied,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:ddocdoc_clone/utils/domain_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EventVoteParentScreen extends StatefulWidget {
  const EventVoteParentScreen({super.key});

  @override
  _EventVoteParentScreen createState() => _EventVoteParentScreen();
}

class _EventVoteParentScreen extends State<EventVoteParentScreen>
    with SingleTickerProviderStateMixin {
  final _tabList = ['이벤트', '투표'];

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
    return Scaffold(
      body: Consumer(builder: (context, watch, child) {
        return SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: const CustomNavigation(
                  title: '이벤트 투표',
                ),
              ),
              const SizedBox(height: 20),
              EventVoteTabBar(
                key: const ValueKey('communityTab'),
                tabController: tabController,
                tabList: _tabList,
              ),
              const SizedBox(height: 15),
              const SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: EventVoteTile(),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      height: 47,
                      child: OutlinedButton(
                        onPressed: () {
                          GoRouter.of(context).push('/app-event');
                        },
                        style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                10), // Changed border radius
                          ),
                          side: BorderSide(
                            color: Colors.black
                                .withOpacity(0.2), // Changed border color
                            width: 1, // Changed border width
                          ),
                        ),
                        child: const Text(
                          '지난 이벤트 보기',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        ), // Changed button text
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}

class EventVoteTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabList;

  const EventVoteTabBar({
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

class EventVoteTile extends StatelessWidget {
  const EventVoteTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 25,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 78, 78, 74),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  //border: Border.all(color: Colors.blue, width: 1.0),
                ),
                child: const Center(
                  child: Text(
                    'N일 남음',
                    style: TextStyle(fontSize: 11.0, color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '2024/03/24까지',
                style: TextStyle(
                    fontSize: 12, color: Colors.black.withOpacity(0.5)),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            '똑닥이 가져온 좋은 소식 3가지',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
            color: Colors.blue.withOpacity(0.3),
            height: 150,
          ),
        ],
      ),
    );
  }
}

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

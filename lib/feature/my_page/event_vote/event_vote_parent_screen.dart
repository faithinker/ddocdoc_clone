import 'package:ddocdoc_clone/utils/domain_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../component/default_tab_bar.dart';
import '../../../component/custom_navigation.dart';

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
              DefaultTabBar(
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


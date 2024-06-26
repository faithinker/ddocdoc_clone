import 'package:flutter/material.dart';
import '../tile/recommend_tile.dart';
import '../tile/recent_tile.dart';
import '../tile/sub_title_tile.dart';
import '../tile/no_recent_tile.dart';
import '../tile/all_remove_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../search_provider.dart';

class SearchScrollScreen extends ConsumerWidget {
  SearchScrollScreen({super.key});

  List<Map<String, dynamic>> dataList = [];
  List<String> recommendKeywords = ['영유아검진', '똑닥예약병원', '야간진료', '독감예방접종', '여의사'];

  // MARK: 기본적으로 3개, 검색어 있을 경우 4개 추가
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchStateProvider);
    return ListView.builder(
      itemCount: searchState.length + (searchState.isEmpty ? 3 : 4),
      itemBuilder: (context, index) {
        if (index == 0) {
          return const SubTitleTile(subTitleType: SearchSubTitleType.recommend);
        } else if (index == 1) {
          return RecommendTile(texts: recommendKeywords);
        } else if (index == 2) {
          return const SubTitleTile(subTitleType: SearchSubTitleType.recent);
        } else if (index == 3 && searchState.isEmpty) {
          return const NoRecentTile();
        } else if (index == searchState.length + 3) {
          return AllRemoveTile();
        } else {
          return RecentTile(
              order: index - 3,
              text: searchState[index - 3].keyword,
              date: searchState[index - 3].date);
        }
      },
    );
  }
}



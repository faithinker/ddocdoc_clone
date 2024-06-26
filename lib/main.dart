import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'utils/domain_url.dart';
import 'utils/router_key.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'feature/bottom_tab/tap_screen.dart';
import 'feature/my_page/event_vote/event_vote_parent_screen.dart';
import 'feature/web_view/web_view_screen.dart';
import 'feature/family_manage/family_manage_screen.dart';
import 'feature/health_feed/health_feed_screen.dart';
import 'feature/favorite_hospital/favorite_hospital_screen.dart';
import 'feature/search/search_screen.dart';
import 'feature/intro/intro_screen.dart';
import 'feature/permission/permission_screen.dart';
import 'feature/pharmacy_map/pharmacy_map_screen.dart';
import 'feature/hospital_map/hospital_map_screen.dart';
import 'feature/community/write/write_screen.dart';
import 'feature/community/write_detail/write_detail_screen.dart';
import 'feature/community/profile/profile_screen.dart';
import 'feature/community/write_detail/write_detail_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(clientId: 'qyfcvnrnq8');
  runApp(const ProviderScope(
    child: DdocdocApp(),
  ));
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: RouterKey.initial,
      builder: (context, state) => const IntroScreen(),
    ),
    GoRoute(
      path: RouterKey.bottomTab,
      builder: (context, state) => TabScreen(),
    ),
    GoRoute(
      path: RouterKey.permission,
      builder: (context, state) => PermissionScreen(),
    ),
    GoRoute(
        path: RouterKey.service,
        builder: (context, state) =>
            WebViewScreen(url: DomainURL.service, title: '이용약관')),
    // GoRoute(
    //     path: RouterKey.eventVote,
    //     builder: (context, state) => const EventVoteParentScreen()),
    GoRoute(
        path: RouterKey.webUrlPath,
        builder: (context, state) {
          final url = state.pathParameters['url']!;
          return WebViewScreen(
            url: url,
            title: '',
          );
        }),
    GoRoute(
        path: RouterKey.eventVote,
        builder: (context, state) => WebViewScreen(
              url: DomainURL.appEventEnded,
              title: '지난 이벤트',
            )),
    GoRoute(
        path: RouterKey.appEvent,
        builder: (context, state) => const FamilyManageScreen()),
    GoRoute(
        path: RouterKey.healthFeed,
        builder: (context, state) => const HealthFeedScreen()),
    GoRoute(
        path: RouterKey.favoriteHospital,
        builder: (context, state) => const FavoriteHospitalScreen()),
    GoRoute(
        path: RouterKey.search,
        builder: (context, state) => const SearchScreen()),
    GoRoute(
        path: RouterKey.pharmacyMap,
        builder: (context, state) => const PharmacyMapScreen()),
    GoRoute(
        path: RouterKey.hospitalMap,
        builder: (context, state) => const HospitalMapScreen()),
    GoRoute(
        path: RouterKey.write,
        builder: (context, state) => WriteScreen(),
        pageBuilder: (context, state) => MaterialPage(child: WriteScreen())),
    GoRoute(
        path: RouterKey.writeDetailPath,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return WriteDetailScreen(
            id: id,
          );
        }),
    GoRoute(
        path: RouterKey.profilePath,
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProfileScreen(
            id: id,
          );
        }),
  ],
);

class DdocdocApp extends StatelessWidget {
  const DdocdocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.notoSansTextTheme(),
        ),
      ),
    );
  }
}

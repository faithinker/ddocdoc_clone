import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../utils/domain_url.dart';
import 'feature/bottom_tab/tap_screen.dart';
import 'feature/my_page/event_vote/event_vote_parent_screen.dart';
import 'feature/web_view/web_view_screen.dart';
import 'feature/family_manage/family_manage_screen.dart';
import 'feature/health_feed/health_feed_screen.dart';
import 'feature/favorite_hospital/favorite_hospital_screen.dart';
import 'feature/search/search_screen.dart';
import 'feature/intro/intro_screen.dart';
import 'feature/permission/permission_screen.dart';


void main() {
  runApp(const ProviderScope(
    child: DdocdocApp(),
  ));
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => IntroScreen(),
    ),
    GoRoute(
      path: '/bottom-tab',
      builder: (context, state) => TabScreen(),
    ),
    GoRoute(
      path: '/permission',
      builder: (context, state) => PermissionScreen(),
    ),
    GoRoute(
        path: '/service',
        builder: (context, state) =>
            WebViewScreen(url: DomainURL.service, title: '이용약관')),
    GoRoute(
        path: '/event-vote',
        builder: (context, state) => const EventVoteParentScreen()),
    GoRoute(
        path: '/app-event',
        builder: (context, state) => WebViewScreen(
              url: DomainURL.appEventEnded,
              title: '지난 이벤트',
            )),
    GoRoute(
        path: '/family-manage',
        builder: (context, state) => const FamilyManageScreen()),
    GoRoute(
        path: '/health-feed',
        builder: (context, state) => const HealthFeedScreen()),
    GoRoute(
        path: '/favorite-hospital',
        builder: (context, state) => const FavoriteHospitalScreen()),
    GoRoute(path: '/search', builder: (context, state) => const SearchScreen()),
  ],
);

class DdocdocApp extends StatelessWidget {
  const DdocdocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.notoSansTextTheme(),
      ),
    );
  }
}

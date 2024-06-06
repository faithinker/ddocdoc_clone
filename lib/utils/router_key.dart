// TODO: DI(get_it) 사용하여 import 없이 사용하도록 고치기

class RouterKey {
  static const String initial = '/';
  static const String bottomTab = '/bottom-tab';
  static const String permission = '/permission';
  static const String service = '/service';
  static const String eventVote = '/event-vote';
  static const String appEvent = '/app-event';
  static const String familyManage = '/family-manage';
  static const String healthFeed = '/health-feed';
  static const String favoriteHospital = '/favorite-hospital';
  static const String search = '/search';
  static const String pharmacyMap = '/pharmacy-map';
  static const String hospitalMap = '/hosptial-map';
  static const String webUrlPath = '/webview/:url';
  static String webUrl(String url) => '/webview/${Uri.encodeComponent(url)}';
  static const String write = '/write';
  static const String writeDetailPath = '/write-detail/:id';
  static String writeDetail(String id) => '/write-detail/${id}';
  static const String profilePath = '/profile/:id';
  static String profile(String id) => '/write-detail/${id}';
}

// TODO: DI(get_it) 사용하여 import 없이 사용하도록 고치기

class RouterKey {
  static const initial = '/';
  static const bottomTab = '/bottom-tab';
  static const permission = '/permission';
  static const service = '/service';
  static const eventVote = '/event-vote';
  static const appEvent = '/app-event';
  static const familyManage = '/family-manage';
  static const healthFeed = '/health-feed';
  static const favoriteHospital = '/favorite-hospital';
  static const search = '/search';
  static const pharmacyMap = '/pharmacy-map';
  static const hospitalMap = '/hosptial-map';
  static String webUrl(String url) => '/webview/${Uri.encodeComponent(url)}';
  static const write = '/write';
}

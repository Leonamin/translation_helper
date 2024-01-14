enum RouteConfig {
  home,
}

extension RouteConfigExt on RouteConfig {
  String get name {
    switch (this) {
      case RouteConfig.home:
        return 'home';
      default:
        return '404';
    }
  }
}

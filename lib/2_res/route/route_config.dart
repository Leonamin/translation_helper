enum RouteConfig {
  home,
  fileDetail,
}

extension RouteConfigExt on RouteConfig {
  String get routeName {
    switch (this) {
      case RouteConfig.home:
        return 'home';
      case RouteConfig.fileDetail:
        return 'file_detail';
      default:
        return '404';
    }
  }
}

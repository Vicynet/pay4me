enum RouteName {
  
  root(path: "/"),
  home(path: "/home"),

  history(path: "/history"),
  more(path: "/more");

  const RouteName({required this.path});
  final String path;

  String get navigate {
    if (path.startsWith("/")) {
      return path;
    }
    return "/$path";
  }
}

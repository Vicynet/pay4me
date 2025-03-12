import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:pay4me/core/routes/route_name.dart";
import "package:pay4me/core/utils/extensions/extension_fun.dart";
import "package:pay4me/features/global_widgets/tab_navigation_widget.dart";
import "package:pay4me/features/history/presentation/ui/history_page.dart";
import "package:pay4me/features/home/presentation/ui/home_page.dart";
import "package:pay4me/features/more/presentation/ui/more_page.dart";

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: "root");

GlobalKey<NavigatorState> get navigatorKey => _rootNavigatorKey;

//
class AppRoutes with NavigationPathObserver {
  GoRouter get getRoutesConfig => _router;
  //
  static final GoRouter _router = GoRouter(
    refreshListenable: null,
    debugLogDiagnostics: kDebugMode,
    navigatorKey: _rootNavigatorKey,
    initialLocation: RouteName.root.path,
    redirect: (context, state) {
      return null;
    },

    routes: [
      GoRoute(
        path: "/",
        redirect: (context, state) => RouteName.home.path,
      ),
      StatefulShellRoute.indexedStack(
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state,
            StatefulNavigationShell navigationShell) {
          return TabNavigationScreen(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: RouteName.home.path,
                builder: (BuildContext context, GoRouterState state) {
                  return HomePage();
                },
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: RouteName.history.path,
                builder: (BuildContext context, GoRouterState state) {
                  return HistoryPage();
                },
                routes: [],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                  path: RouteName.more.path,
                  builder: (BuildContext context, GoRouterState state) {
                    return MorePage();
                  },
                  routes: []),
            ],
          ),
        ],
      ),
    ],
  );
}

mixin NavigationPathObserver {
  late String currentPath;

  static String getRouteState(GoRouterState state) {
    String path = state.fullPath ?? "/*";
    "GoRouterState path: $path\n".debugString;
    return path;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pay4me/core/locator/service_locator.dart';
import 'package:pay4me/core/routes/app_route.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  serviceLocatorInitializer();

  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]).then((_) async {
    runApp(
      ProviderScope(child: MainApp()),
    );
  });
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final window = View.of(context);
    final physicalScreenSize = window.physicalSize;
    final pixelRatio = window.devicePixelRatio;
    final screenWidthDp = physicalScreenSize.width / pixelRatio;
    final screenHeightDp = physicalScreenSize.height / pixelRatio;
    return ScreenUtilInit(
      designSize: Size(screenWidthDp, screenHeightDp),
      splitScreenMode: false,
      minTextAdapt: true,
      builder: (_, __) => MediaQuery.withClampedTextScaling(
        minScaleFactor: 0.7,
        maxScaleFactor: 1.2,
        child: MaterialApp.router(
          routerConfig: AppRoutes().getRoutesConfig,
          theme: ThemeData.light(),
          scaffoldMessengerKey: globalMessengerKey,
          title: "Pay4me",
          debugShowCheckedModeBanner: true,
        ),
      ),
    );
  }
}

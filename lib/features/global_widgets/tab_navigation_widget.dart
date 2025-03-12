import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:flutter_svg/svg.dart";
import "package:go_router/go_router.dart";
import "package:pay4me/core/routes/app_route.dart";
import "package:pay4me/core/utils/image_constants.dart";

final GlobalKey<ScaffoldState> drawerKey = GlobalKey();

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
  });

  final Widget icon; // Accepts both Icon and SvgPicture
  final Widget activeIcon; // Accepts both Icon and SvgPicture
  final String? title;
}

class TabNavigationScreen extends ConsumerWidget {
  /// Constructs an `DashboardNavigationScreen`.
  TabNavigationScreen({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>("ScaffoldWithNavBar"));

  final StatefulNavigationShell navigationShell;

  final List<BottomMenuModel> _bottomMenuList = [
    BottomMenuModel(
      icon: SvgPicture.asset(
        ImageConstant.imgHome,
        width: 24.w,
        height: 24.w,
        colorFilter: const ColorFilter.mode(Color(0xff161616), BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        ImageConstant.imgHome, // Use a different SVG for active state if needed
        width: 24.w,
        height: 24.w,
        colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
      ),
      title: "Home",
    ),
    BottomMenuModel(
      icon: Icon(Icons.history, color: Color(0xff161616), size: 30.w),
      activeIcon: Icon(Icons.history, color: Colors.blue, size: 30.w),
      title: "History",
    ),
    BottomMenuModel(
      icon: Icon(Icons.grid_view, color: Color(0xff161616), size: 30.w),
      activeIcon: Icon(Icons.grid_view, color: Colors.blue, size: 30.w),
      title: "More",
    ),
  ];

  Widget buildBottomNavBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Home and History in pill-shaped container
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFECEFF1), // Light blue/gray color
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Home Tab
                    _buildNavItem(context, _bottomMenuList[0], 0),
                    SizedBox(width: 40),
                    // History Tab
                    _buildNavItem(context, _bottomMenuList[1], 1),
                  ],
                ),
              ),

              // More in circular container
              Container(
                padding: EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: Color(0xFFECEFF1), // Light blue/gray color
                  shape: BoxShape.circle,
                ),
                child: _buildNavItem(context, _bottomMenuList[2], 2),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, BottomMenuModel item, int index) {
    bool isSelected = navigationShell.currentIndex == index;

    return InkWell(
      onTap: () => _onItemTapped(index, context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isSelected
              ? item.activeIcon // This is your ImageConstant asset
              : item.icon, // This is your Icon widget
          SizedBox(height: 8),
          Text(
            item.title ?? "",
            style: TextStyle(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? Colors.blue : Color(0xFF424242),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: navigationShell,
      bottomNavigationBar: buildBottomNavBar(context),

      // bottomNavigationBar: Container(
      //   margin: EdgeInsets.only(bottom: 21.r),
      //   decoration: BoxDecoration(
      //     border: Border(
      //         top: BorderSide(
      //             width: 1.r, color: Color(0xff161616).withOpacity(.2))),
      //   ),
      //   height: 49.h,
      //   child: BottomNavigationBar(
      //     backgroundColor: Colors.transparent,
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     selectedFontSize: 0,
      //     elevation: 0,
      //     type: BottomNavigationBarType.fixed,
      //     items: List.generate(_bottomMenuList.length, (index) {
      //       return BottomNavigationBarItem(
      //         icon: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             _bottomMenuList[index].icon,
      //             Text(
      //               _bottomMenuList[index].title ?? "",
      //               style: TextStyle(
      //                 fontSize: 10.sp,
      //                 fontWeight: FontWeight.w700,
      //                 color: Color(0xff161616),
      //               ),
      //             ),
      //           ],
      //         ),
      //         activeIcon: Column(
      //           mainAxisSize: MainAxisSize.min,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             _bottomMenuList[index].icon,
      //             Text(
      //               _bottomMenuList[index].title ?? "",
      //               style: TextStyle(
      //                 fontSize: 10.sp,
      //                 fontWeight: FontWeight.w700,
      //                 color: Color(0xff161616),
      //               ),
      //             ),
      //           ],
      //         ),
      //         label: "",
      //       );
      //     }),
      //     currentIndex: navigationShell.currentIndex,
      //     onTap: (int idx) => _onItemTapped(idx, context),
      //   ),
      // ),
    );
  }

  static void showScrollControlledModalBottomSheet(
      {required Widget child, required String barrierLabel}) {
    showModalBottomSheet(
      context: navigatorKey.currentContext!,
      isDismissible: true,
      isScrollControlled: true,
      barrierColor: Color(0xff161616).withOpacity(0.6),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.r))),
      builder: (context) => Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: child,
      ),
    );
  }

  static void showGlobalModalBottomSheet(
      {required Widget child, required String barrierLabel}) {
    showModalBottomSheet(
        context: navigatorKey.currentContext!,
        isDismissible: true,
        isScrollControlled: true,
        barrierColor: Color(0xff161616).withOpacity(0.6),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.r))),
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: child,
            ));
  }

  void _onItemTapped(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

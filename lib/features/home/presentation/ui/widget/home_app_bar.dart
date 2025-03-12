import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay4me/core/utils/image_constants.dart';

final toggleProvider = StateProvider<bool>((ref) => false);
final notificationCountProvider = StateProvider<int>((ref) => 3);

class HomeAppBar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  ConsumerState<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _HomeAppBarState extends ConsumerState<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    final isToggled = ref.watch(toggleProvider);
    final notificationCount = ref.watch(notificationCountProvider);

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leadingWidth: 200,
      leading: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.green,
              backgroundImage: AssetImage(
                  ImageConstant.imgAvatar), 
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: Color(0xFFECEFF1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () =>
                        ref.read(toggleProvider.notifier).state = false,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isToggled ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: SvgPicture.asset(
                        ImageConstant
                            .imgHome, 
                        colorFilter: ColorFilter.mode(
                          isToggled ? Colors.white : Colors.black,
                          BlendMode.srcIn,
                        ),
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: () => ref.read(toggleProvider.notifier).state = true,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: !isToggled ? Colors.blue : Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: SvgPicture.asset(
                        ImageConstant
                            .imgCommunity, 
                        colorFilter: ColorFilter.mode(
                          !isToggled ? Colors.white : Colors.black,
                          BlendMode.srcIn,
                        ),
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Color(0xFF6D6D6D),
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                ImageConstant.imgPayIon,
                height: 24,
                width: 24,
              ),
              onPressed: () {},
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFECEFF1),
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon:  SvgPicture.asset(
                    ImageConstant.imgAlert,
                    height: 24,
                    width: 24,
                  ),
                  onPressed: () {},
                ),
              ),
              if (notificationCount > 0)
                Positioned(
                  top: 4,
                  right: 8,
                  child: Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      notificationCount.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay4me/core/utils/image_constants.dart';
import 'package:pay4me/features/home/presentation/notifier/home_page.notifier.dart';

class CreatePostBottomSheet extends ConsumerWidget {
  const CreatePostBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final readState = ref.read(homePageStateNotifierProvider);
    final stateRef = ref.watch(homePageStateNotifierProvider);

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close_sharp, color: Colors.black54),
                  onPressed: () => Navigator.pop(context),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Cancel",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            Row(
              children: [
                const CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://picsum.photos/150/150"),
                  radius: 20,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Paul Adah",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "@paulsunday",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 16, top: 20, right: 8),
                        child: SvgPicture.asset(
                          ImageConstant.imgCreatePost,
                          height: 18,
                          width: 18,
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          maxLines: 5,
                          autofocus: true,
                          controller: stateRef.postContent,
                          decoration: const InputDecoration(
                            hintText: "Write your post",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(top: 16, right: 16),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(
                            ImageConstant.imgPostImage,
                            height: 24,
                            width: 24,
                          ),
                          onPressed: () {},
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(),
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            ImageConstant.imgPostVideo,
                            height: 24,
                            width: 24,
                          ),
                          onPressed: () {},
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(),
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            ImageConstant.imgAlertOff,
                            height: 24,
                            width: 24,
                          ),
                          onPressed: () {},
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(),
                        ),
                        IconButton(
                          icon: SvgPicture.asset(
                            ImageConstant.imgPostList,
                            height: 24,
                            width: 24,
                          ),
                          onPressed: () {},
                          padding: const EdgeInsets.all(8),
                          constraints: const BoxConstraints(),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: readState.postContent!.text.isNotEmpty
                              ? () {}
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF7AC52D),
                            disabledBackgroundColor: Colors.green[300],
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text("Post"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

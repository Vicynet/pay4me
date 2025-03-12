import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pay4me/features/home/presentation/notifier/home_page.notifier.dart';

class PostActionBottomSheet extends ConsumerWidget {
  const PostActionBottomSheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postActionItems = ref.watch(homePageStateNotifierProvider).postActionItems;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Actions",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  icon: const Icon(Icons.close_sharp, color: Colors.black54),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),    
          ...List.generate(postActionItems.length, (index) {
            final item = postActionItems[index];
            return Column(
              children: [
                ListTile(
                  leading: item.icon,
                  title: Text(
                    item.title,
                    style: TextStyle(
                      fontSize: 16,
                      color:
                         Colors.black87,
                      fontWeight:
                          FontWeight.w400,
                    ),
                  ),
                  trailing:
                      const Icon(Icons.chevron_right, color: Colors.black38),
                  onTap: () {
                  },
                ),
               const Divider(),
              ],
            );
          }),
        ],
      ),
    );
  }
}
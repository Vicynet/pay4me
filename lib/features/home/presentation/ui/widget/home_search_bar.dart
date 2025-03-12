import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pay4me/features/home/presentation/notifier/home_page.notifier.dart';

class HomeSearchBar extends ConsumerStatefulWidget {
  const HomeSearchBar({super.key});

  @override
  ConsumerState<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends ConsumerState<HomeSearchBar> {

  @override
  Widget build(BuildContext context) {
    final readState = ref.read(homePageStateNotifierProvider.notifier);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, 
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Text(
              'Community',
              style: TextStyle(
                fontSize: 16, 
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
          ),

          Container(
            width: double.infinity, 
            height: 64.0,
            decoration: BoxDecoration(
              color: Color(0xFFF8F9FB),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey, width: 1),
            ),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText:
                          'Search keywords like SEVIS, United States, Canada',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    style: TextStyle(fontSize: 16),
                    onChanged: readState.searchQuery,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

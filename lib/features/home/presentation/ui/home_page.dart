import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay4me/core/utils/image_constants.dart';
import 'package:pay4me/features/home/presentation/notifier/home_page.notifier.dart';
import 'package:pay4me/features/home/presentation/ui/widget/home_app_bar.dart';
import 'package:pay4me/features/home/presentation/ui/widget/home_search_bar.dart';
import 'package:pay4me/features/home/presentation/ui/widget/post_card.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool _showSearchBar = true;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_showSearchBar) {
        setState(() {
          _showSearchBar = false;
        });
      }
    }

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_showSearchBar) {
        setState(() {
          _showSearchBar = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final stateRef = ref.watch(homePageStateNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(),
      body: Column(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: _showSearchBar ? 122 : 0,
            child: _showSearchBar ? HomeSearchBar() : Container(),
          ),
          Expanded(
            child: stateRef.loadingState!
                ? Center(child: CircularProgressIndicator())
                : stateRef.postList.isEmpty
                    ? Center(
                        child: Text("No posts found",
                            style: TextStyle(fontSize: 16, color: Colors.grey)))
                    : ListView.builder(
                        controller: _scrollController,
                        padding: EdgeInsets.only(top: 8.0),
                        itemCount: stateRef.postList.length,
                        itemBuilder: (context, index) {
                          return PostCard(post: stateRef.postList[index]);
                        },
                      ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => stateRef.showCreatePostBottomSheet(context),
        shape: const CircleBorder(),
        backgroundColor: Color(0xFF7AC52D),
        child: SvgPicture.asset(
          ImageConstant.imgPost,
          height: 24,
          width: 24,
        ),
      ),
    );
  }
}

import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:pay4me/core/locator/service_locator.dart";
import "package:pay4me/core/utils/image_constants.dart";
import "package:pay4me/features/home/application/usecase/get_posts.usecase.dart";
import "package:pay4me/features/home/presentation/state/home_page.state.dart";
import "package:riverpod_annotation/riverpod_annotation.dart";

part "home_page.notifier.g.dart";

@riverpod
class HomePageStateNotifier extends _$HomePageStateNotifier {
  @override
  HomePageStateHandler build() {
    final initialState = HomePageStateHandler(
      form: GlobalKey<FormState>(),
      postContent: TextEditingController(),
      loadingState: false,
      postActionItems: [
        PostActionItem(
          icon: SvgPicture.asset(
            ImageConstant.imgAlertOff,
            height: 24,
            width: 24,
          ),
          title: "Notify Me",
        ),
        PostActionItem(
          icon: SvgPicture.asset(
            ImageConstant.imgEdit,
            height: 24,
            width: 24,
          ),
          title: "Edit Post",
        ),
        PostActionItem(
          icon: SvgPicture.asset(
            ImageConstant.imgFlag,
            height: 24,
            width: 24,
          ),
          title: "Flag Post",
        ),
      ],
      selectedPostActionItem: null,
      postList: [],
      searchController: TextEditingController(),
    );

    state = initialState;

    Future.microtask(() => fetchPosts());

    return state;
  }

  void _setLoading(bool isLoading) {
    state = state.copyWith(loadingState: isLoading);
  }

  Future<void> fetchPosts() async {
    _setLoading(true);

    final result = await getIt<GetPostsUsecase>().call();

    if (result.res != null) {
      state = state.copyWith(postList: result.res);
    }

    _setLoading(false);
  }

  void searchQuery(String query) {
    if (query.isEmpty) {
      fetchPosts();
      return;
    }

    final filteredList = state.postList.where((post) {
      return post.content.toLowerCase().contains(query.toLowerCase()) ||
          post.username.toLowerCase().contains(query.toLowerCase()) ||
          post.handle.toLowerCase().contains(query.toLowerCase());
    }).toList();

    state = state.copyWith(postList: filteredList);
  }

  void selectPostAction(PostActionItem e) {
    state = state.copyWith(selectedPostActionItem: e);
  }
}
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pay4me/features/home/data/model/response/post_response_model.dart';
import 'package:pay4me/features/home/presentation/ui/widget/create_post_bottom_sheet.dart';
import 'package:pay4me/features/home/presentation/ui/widget/post_action_bottom_sheet.dart';

class PostActionItem {
  final Widget icon;
  final String title;

  PostActionItem(
      {required this.icon, required this.title});
}

class HomePageStateHandler extends Equatable {
  final GlobalKey<FormState> form;
  final TextEditingController? postContent;
  final bool? loadingState;
  final List<PostActionItem> postActionItems;
  final PostActionItem? selectedPostActionItem;
  final List<PostResponseModel> postList;
  final TextEditingController? searchController;

  const HomePageStateHandler({
    required this.form,
    this.postContent,
    this.loadingState,
    this.postActionItems = const [],
    this.selectedPostActionItem,
    this.postList = const [],
    this.searchController,
  });

  HomePageStateHandler copyWith(
          {TextEditingController? postContent,
          bool? loadingState,
          List<PostActionItem>? postActionItems,
          PostActionItem? selectedPostActionItem,
          List<PostResponseModel>? postList,
          TextEditingController? searchController}) =>
      HomePageStateHandler(
          form: form,
          postContent: postContent ?? this.postContent,
          loadingState: loadingState ?? this.loadingState,
          postActionItems: postActionItems ?? this.postActionItems,
          selectedPostActionItem:
              selectedPostActionItem ?? this.selectedPostActionItem,
          postList: postList ?? this.postList,
          searchController: searchController ?? this.searchController);

  String? validatePostField(String? value) {
    if (value == null || value.isEmpty) {
      return "err_invalid_input";
    }
    return null;
  }

  void showCreatePostBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const CreatePostBottomSheet(),
    );
  }

  void showPostActionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => const PostActionBottomSheet(),
    );
  }

  @override
  List<Object?> get props => [
        postContent,
        loadingState,
      ];
}

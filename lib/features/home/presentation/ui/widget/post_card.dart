import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pay4me/core/utils/image_constants.dart';
import 'package:pay4me/features/home/data/model/response/post_response_model.dart';
import 'package:intl/intl.dart';
import 'package:pay4me/features/home/presentation/notifier/home_page.notifier.dart';
import 'package:cached_network_image/cached_network_image.dart';


class PostCard extends ConsumerWidget {
  final PostResponseModel post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
        final stateRef = ref.watch(homePageStateNotifierProvider);

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage:  CachedNetworkImageProvider(post.profileImage),
                  onBackgroundImageError: (exception, stackTrace) {
                    debugPrint("Error!");
                  },
                  radius: 20,
                ),
                const SizedBox(width: 12.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        post.handle,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  _formatTimestamp(post.timestamp),
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  onPressed: () => stateRef.showPostActionBottomSheet(context),
                  iconSize: 20,
                  splashRadius: 20,
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Text(
              post.content,
              style: const TextStyle(fontSize: 16),
            ),
            if (post.media.isNotEmpty) ...[
              const SizedBox(height: 12.0),
              _buildMediaSection(post.media),
            ],
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildActionButton(
                    SvgPicture.asset(
                      ImageConstant
                          .imgCommunity, 
                      colorFilter: ColorFilter.mode(
                        Colors.black,
                        BlendMode.srcIn,
                      ),
                      height: 20,
                      width: 20,
                    ),
                    post.comments.toString()),
                SizedBox(width: 20),
                _buildActionButton(
                    Icon(Icons.favorite_border,
                        size: 20, color: Colors.grey[700]),
                    post.likes.toString()),
                SizedBox(width: 20),
                _buildActionButton(
                    Icon(Icons.repeat, size: 20, color: Colors.grey[700]),
                    post.shares.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(Widget icon, String count) {
    return Row(
      children: [
        icon,
        const SizedBox(width: 4),
        Text(
          count,
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildMediaSection(List<String> mediaUrls) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: mediaUrls.length == 1
          ? _buildSingleMedia(mediaUrls.first)
          : _buildMultipleMedia(mediaUrls),
    );
  }

  Widget _buildSingleMedia(String url) {
    return Image(
      image: CachedNetworkImageProvider(url),
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

Widget _buildMultipleMedia(List<String> mediaUrls) {
  return SizedBox(
    height: 240,
    child: Column(
      children: [
        Expanded(
          flex: 1,
          child: Row(
            children: [
              Expanded(
                child: _buildImage(mediaUrls[0]),
              ),
              const SizedBox(width: 2),
              Expanded(
                child: _buildImage(mediaUrls[1]),
              ),
            ],
          ),
        ),
        if (mediaUrls.length == 3) ...[
          const SizedBox(height: 2),
          Expanded(
            flex: 1,
            child: _buildImage(mediaUrls[2], fullWidth: true),
          ),
        ],
        if (mediaUrls.length == 4) ...[
          const SizedBox(height: 2),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: _buildImage(mediaUrls[2]),
                ),
                const SizedBox(width: 2),
                Expanded(
                  child: _buildImage(mediaUrls[3]),
                ),
              ],
            ),
          ),
        ],
      ],
    ),
  );
}

Widget _buildImage(String url, {bool fullWidth = false}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12.0),
    child: Image(
      image: CachedNetworkImageProvider(url),
      width: fullWidth ? double.infinity : null,
      fit: BoxFit.cover,
    ),
  );
}

String _formatTimestamp(String timestamp) {
  final DateTime postTime = DateTime.parse(timestamp);
  final DateTime now = DateTime.now();
  final Duration difference = now.difference(postTime);

  if (difference.inSeconds < 60) {
    return 'Just now';
  } else if (difference.inMinutes < 60) {
    return '${difference.inMinutes}m';
  } else if (difference.inHours < 24) {
    return '${difference.inHours}h';
  } else {
    // Format time like "11:23AM"
    return DateFormat('h:mma').format(postTime);
  }
}

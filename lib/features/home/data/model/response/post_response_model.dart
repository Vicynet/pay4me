import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_response_model.g.dart';

@JsonSerializable()
class PostResponseModel extends Equatable {
  final String id;
  final String username;
  final String handle;
  final String profileImage;
  final String content;
  final List<String> media; 
  final int comments;
  final int likes;
  final int shares;
  final String timestamp;

  const PostResponseModel({
    required this.id,
    required this.username,
    required this.handle,
    required this.profileImage,
    required this.content,
    required this.media,
    required this.comments,
    required this.likes,
    required this.shares,
    required this.timestamp,
  });

  factory PostResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PostResponseModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostResponseModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        username,
        handle,
        profileImage,
        content,
        media,
        comments,
        likes,
        shares,
        timestamp
      ];
}

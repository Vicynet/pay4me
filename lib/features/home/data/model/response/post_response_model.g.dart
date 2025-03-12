// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostResponseModel _$PostResponseModelFromJson(Map<String, dynamic> json) =>
    PostResponseModel(
      id: json['id'] as String,
      username: json['username'] as String,
      handle: json['handle'] as String,
      profileImage: json['profileImage'] as String,
      content: json['content'] as String,
      media: (json['media'] as List<dynamic>).map((e) => e as String).toList(),
      comments: (json['comments'] as num).toInt(),
      likes: (json['likes'] as num).toInt(),
      shares: (json['shares'] as num).toInt(),
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$PostResponseModelToJson(PostResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'handle': instance.handle,
      'profileImage': instance.profileImage,
      'content': instance.content,
      'media': instance.media,
      'comments': instance.comments,
      'likes': instance.likes,
      'shares': instance.shares,
      'timestamp': instance.timestamp,
    };

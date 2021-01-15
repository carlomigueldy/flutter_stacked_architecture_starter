// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoComment _$PhotoCommentFromJson(Map<String, dynamic> json) {
  return PhotoComment(
    photoCommentId: json['photo_comment_id'] as String,
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    comment: json['comment'] as String,
    likedBy: (json['liked_by'] as List)
        .map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PhotoCommentToJson(PhotoComment instance) =>
    <String, dynamic>{
      'photo_comment_id': instance.photoCommentId,
      'user': instance.user,
      'comment': instance.comment,
      'liked_by': instance.likedBy,
    };

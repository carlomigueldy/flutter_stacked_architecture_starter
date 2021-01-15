// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Photo _$PhotoFromJson(Map<String, dynamic> json) {
  return Photo(
    photoId: json['photo_id'] as String,
    photoUrl: json['photo_url'] as String,
    description: json['description'] as String,
    likedBy: (json['liked_by'] as List)
        .map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
    comments: (json['comments'] as List)
        .map((e) => PhotoComment.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$PhotoToJson(Photo instance) => <String, dynamic>{
      'photo_id': instance.photoId,
      'photo_url': instance.photoUrl,
      'description': instance.description,
      'liked_by': instance.likedBy,
      'comments': instance.comments,
    };

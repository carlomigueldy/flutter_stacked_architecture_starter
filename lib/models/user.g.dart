// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    fullName: json['full_name'] as String,
    category: json['category'] as String,
    description: json['description'] as String,
    followers: (json['followers'] as List)
        .map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
    following: (json['following'] as List)
        .map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
    photos: (json['photos'] as List)
        .map((e) => Photo.fromJson(e as Map<String, dynamic>))
        .toList(),
    userId: json['user_id'] as String,
    photoUrl: json['photo_url'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'user_id': instance.userId,
      'photo_url': instance.photoUrl,
      'full_name': instance.fullName,
      'category': instance.category,
      'description': instance.description,
      'followers': instance.followers,
      'following': instance.following,
      'photos': instance.photos,
    };

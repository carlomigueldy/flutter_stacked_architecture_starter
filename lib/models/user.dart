import 'package:json_annotation/json_annotation.dart';

import 'photo.dart';

part 'user.g.dart';

@JsonSerializable(
  nullable: false,
  fieldRename: FieldRename.snake,
)
class User {
  final String userId;
  final String photoUrl;
  final String fullName;
  final String category;
  final String description;
  final List<User> followers;
  final List<User> following;
  List<Photo> photos;

  User({
    this.fullName,
    this.category,
    this.description,
    this.followers,
    this.following,
    this.photos,
    this.userId,
    this.photoUrl,
  });

  setPhotos(List<Photo> payload) {
    this.photos = payload;
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

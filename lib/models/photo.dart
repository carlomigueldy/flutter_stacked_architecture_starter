import 'package:flutter_instagram_ui_clone/models/photo_comment.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'photo.g.dart';

@JsonSerializable(
  nullable: false,
  fieldRename: FieldRename.snake,
)
class Photo {
  final String photoId;
  final String photoUrl;
  final String description;
  final List<User> likedBy;
  final List<PhotoComment> comments;

  Photo({
    this.photoId,
    this.photoUrl,
    this.description,
    this.likedBy,
    this.comments,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

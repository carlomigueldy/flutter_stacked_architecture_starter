import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'photo_comment.g.dart';

@JsonSerializable(
  nullable: false,
  fieldRename: FieldRename.snake,
)
class PhotoComment {
  final String photoCommentId;
  final User user;
  final String comment;
  final List<User> likedBy;

  PhotoComment({
    this.photoCommentId,
    this.user,
    this.comment,
    this.likedBy,
  });

  factory PhotoComment.fromJson(Map<String, dynamic> json) =>
      _$PhotoCommentFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoCommentToJson(this);
}

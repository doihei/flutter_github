import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String login,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    @JsonKey(name: 'html_url') String? htmlUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
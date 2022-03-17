import 'package:freezed_annotation/freezed_annotation.dart';

// entity
import 'package:github/models/entities/user.dart';

// converter
import 'package:github/models/converters/date_time_converter.dart';

part 'repository.freezed.dart';
part 'repository.g.dart';

@freezed
class Repository with _$Repository {
  const factory Repository({
    required int id,
    required String name,
    @JsonKey(name: 'full_name') String? fullName,
    required User owner,
    @JsonKey(name: 'html_url') String? htmlUrl,
    @JsonKey(name: 'created_at') @DateTimeConverter() DateTime? createdAt,
    @JsonKey(name: 'updated_at') @DateTimeConverter() DateTime? updatedAt,
    required int score,
  }) = _Repository;

  factory Repository.fromJson(Map<String, dynamic> json) => _$RepositoryFromJson(json);
}
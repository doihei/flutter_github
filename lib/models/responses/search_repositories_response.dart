import 'package:freezed_annotation/freezed_annotation.dart';

// entity
import 'package:github/models/entities/repository.dart';

part 'search_repositories_response.freezed.dart';

@freezed
class SearchRepositoriesResponse with _$SearchRepositoriesResponse {
  const factory SearchRepositoriesResponse({
    @JsonKey(name: 'total_count') int? totalCount,
    @Default(<Repository>[]) List<Repository> items,
  }) = _SearchRepositoriesResponse;

  factory SearchRepositoriesResponse.fromJson(Map<String, dynamic> json) => _$SearchRepositoriesResponseFromJson(json);
}
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:github/data/data_source/search_repositories_datasource.dart';
import 'package:github/data/model/response/search_repositories_response.dart';
import 'package:github/domain/use_case/use_case.dart';

part 'search_repositories_use_case.freezed.dart';

final searchRepositoriesUseCaseProvider = Provider<SearchRepositoriesUseCase>(
    (ref) => SearchRepositoriesUseCase(
      ref.watch(searchRepositoriesDataSourceProvider)
    )
);

class SearchRepositoriesUseCase
    extends UseCase<SearchRepositoriesUseCaseParam, Future<SearchRepositoriesResponse>> {
  SearchRepositoriesUseCase(this._searchRepositoriesDataSource);
  final SearchRepositoriesDataSource _searchRepositoriesDataSource;

  @override
  Future<SearchRepositoriesResponse> call(SearchRepositoriesUseCaseParam param) async {
    final response = await _searchRepositoriesDataSource.searchRepositories(
      param.q,
    );
    return response;
  }
}

@freezed
class SearchRepositoriesUseCaseParam with _$SearchRepositoriesUseCaseParam {
  const factory SearchRepositoriesUseCaseParam({
    required String q,
  }) = _SearchRepositoriesUseCaseParam;
}
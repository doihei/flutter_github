import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:github/data/api/github_dio.dart';

import 'package:github/data/model/response/search_repositories_response.dart';

final searchRepositoriesDataSourceProvider = Provider((ref) => SearchRepositoriesDataSource(ref.watch(githubDioProvider)));

abstract class SearchRepositoriesDataSource {
  factory SearchRepositoriesDataSource(Dio dio) = _SearchRepositoriesDataSource;
  Future<SearchRepositoriesResponse> searchRepositories(String q);
}

class _SearchRepositoriesDataSource implements SearchRepositoriesDataSource {
  final Dio _dio;
  _SearchRepositoriesDataSource(this._dio);

  @override
  Future<SearchRepositoriesResponse> searchRepositories(String q) async {
    final queryParameters = <String, dynamic>{
      'q': q,
    };
    final options = Options(
      method: 'GET',
    )
        .compose(
          _dio.options,
          '/search/repositories',
          queryParameters: {
            'q': q,
          },
    );

    final response = await _dio.fetch(options);
    return SearchRepositoriesResponse.fromJson(response.data);
  }
}
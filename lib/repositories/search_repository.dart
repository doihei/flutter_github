import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:github/models/apis/api_client.dart';

import 'package:github/models/responses/search_repositories_response.dart';

final searchRepositoryProvider = Provider((ref) => SearchRepository(ref.watch(apiClientProvider)));

abstract class SearchRepository {
  factory SearchRepository(Dio dio) = _SearchRepository;
  Future<SearchRepositoriesResponse> searchRepositories(String q);
}

class _SearchRepository implements SearchRepository {
  final Dio _dio;
  _SearchRepository(this._dio);

  @override
  Future<SearchRepositoriesResponse> searchRepositories(String q) async {
    final queryParameters = <String, dynamic>{
      'q': q,
    };
    final options = Options(
      method: 'GET',
      responseType: ResponseType.json,
    )
        .compose(
          _dio.options,
          '/search/repositories',
          queryParameters: queryParameters,
    )
        .copyWith(
          baseUrl: _dio.options.baseUrl,
    );

    final response = await _dio.fetch(options);
    return SearchRepositoriesResponse.fromJson(response.data);
  }
}
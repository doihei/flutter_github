import 'package:dio/dio.dart';
import 'package:dio/adapter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logger/logger.dart';

final githubDioProvider = Provider<Dio>((_) => GithubDio.getInstance());

final logger = Logger();

class GithubDio with DioMixin implements Dio {
  GithubDio._([BaseOptions? options]) {
    options = BaseOptions(
        headers: {
          "accept": "application/vnd.github.v3+json",
        },
        baseUrl: "https://api.github.com"
    );
    this.options = options;

    interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      handler.next(options);
    }));

    // Local Log
    interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      logPrint: logger.i,
    ));

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance() => GithubDio._();
}
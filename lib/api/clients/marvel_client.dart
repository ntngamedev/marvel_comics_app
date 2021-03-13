import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:marvel_comics_app/api/contracts/response/comics_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../main.dart';

part 'marvel_client.g.dart';

@RestApi()
abstract class MarvelClient {
  factory MarvelClient(Dio dio,
      {String baseUrl, String privateKey, String publicKey}) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options) {
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        options.queryParameters["ts"] = timestamp;
        options.queryParameters["apikey"] = publicKey;
        options.queryParameters["hash"] = md5.convert(utf8.encode(timestamp.toString() + privateKey + publicKey)).toString();
      },
    ));

    if (inDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return _MarvelClient(dio, baseUrl: baseUrl);
  }

  @GET("/comics?orderBy=-focDate")
  Future<ComicsResponse> getComics();
}

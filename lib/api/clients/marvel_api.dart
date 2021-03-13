import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:marvel_comics_app/api/contracts/response/comics_response.dart';
import 'package:retrofit/retrofit.dart';

part 'marvel_api.g.dart';

@RestApi()
abstract class MarvelAPI {
  factory MarvelAPI(Dio dio, {String baseUrl, String privateKey, String publicKey}) {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options) {
        final timestamp = DateTime.now().millisecondsSinceEpoch;
        options.queryParameters["ts"] = timestamp;
        options.queryParameters["apikey"] = publicKey;
        options.queryParameters["hash"] = md5.convert(utf8.encode(timestamp.toString() + privateKey + publicKey)).toString();
      },
    ));

    return _MarvelAPI(dio, baseUrl: baseUrl);
  }

  @GET("/comics?orderBy=-focDate")
  Future<ComicsResponse> getComics();
}

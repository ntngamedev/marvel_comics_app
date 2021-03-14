// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _MarvelClient implements MarvelClient {
  _MarvelClient(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<ComicsResponse> getComics() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request<Map<String, dynamic>>(
        '/comics?format=Comic&orderBy=-focDate',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = ComicsResponse.fromJson(_result.data);
    return value;
  }
}

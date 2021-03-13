// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comics_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComicsResponse _$ComicsResponseFromJson(Map<String, dynamic> json) {
  return ComicsResponse(
    code: json['code'] as int,
    status: json['status'] as String,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ComicsResponseToJson(ComicsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    offset: json['offset'] as int,
    limit: json['limit'] as int,
    total: json['total'] as int,
    count: json['count'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'total': instance.total,
      'count': instance.count,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    id: json['id'] as int,
    title: json['title'] as String,
    thumbnail: json['thumbnail'] == null
        ? null
        : Thumbnail.fromJson(json['thumbnail'] as Map<String, dynamic>),
    prices: (json['prices'] as List)
        ?.map(
            (e) => e == null ? null : Price.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'prices': instance.prices,
    };

Thumbnail _$ThumbnailFromJson(Map<String, dynamic> json) {
  return Thumbnail(
    path: json['path'] as String,
    extension: json['extension'] as String,
  );
}

Map<String, dynamic> _$ThumbnailToJson(Thumbnail instance) => <String, dynamic>{
      'path': instance.path,
      'extension': instance.extension,
    };

Price _$PriceFromJson(Map<String, dynamic> json) {
  return Price(
    type: json['type'] as String,
    price: (json['price'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$PriceToJson(Price instance) => <String, dynamic>{
      'type': instance.type,
      'price': instance.price,
    };

import 'package:json_annotation/json_annotation.dart';
import 'package:marvel_comics_app/domain/entities/comic.dart';

part 'comics_response.g.dart';

@JsonSerializable()
class ComicsResponse {
  int code;
  String status;
  Data data;
  
  ComicsResponse({
    this.code,
    this.status,
    this.data,
  });

  factory ComicsResponse.fromJson(Map<String, dynamic> json) => _$ComicsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ComicsResponseToJson(this);
}

@JsonSerializable()
class Data {
  int offset;
  int limit;
  int total;
  int count;
  List<Result> results;
  
  Data({
    this.offset,
    this.limit,
    this.total,
    this.count,
    this.results,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Result {
  int id;
  String title;
  Thumbnail thumbnail;
  List<Price> prices;

  Result({
    this.id,
    this.title,
    this.thumbnail,
    this.prices,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);
  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Thumbnail {
  String path;
  String extension;

  Thumbnail({
    this.path,
    this.extension,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => _$ThumbnailFromJson(json);
  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}

@JsonSerializable()
class Price {
  String type;
  double price;

  Price({
    this.type,
    this.price,
  });

  factory Price.fromJson(Map<String, dynamic> json) => _$PriceFromJson(json);
  Map<String, dynamic> toJson() => _$PriceToJson(this);
}
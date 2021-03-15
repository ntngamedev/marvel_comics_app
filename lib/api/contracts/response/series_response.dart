import 'package:json_annotation/json_annotation.dart';

part 'series_response.g.dart';

@JsonSerializable()
class SeriesResponse {
  int code;
  String status;
  Data data;

  SeriesResponse({
    this.code,
    this.status,
    this.data,
  });

  factory SeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$SeriesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SeriesResponseToJson(this);
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

  Result({
    this.id,
    this.title,
    this.thumbnail,
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

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
  Map<String, dynamic> toJson() => _$ThumbnailToJson(this);
}

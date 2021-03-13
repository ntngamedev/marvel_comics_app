import 'package:marvel_comics_app/api/contracts/response/comics_response.dart';
import 'package:marvel_comics_app/domain/entities/comic.dart';

extension ComicsResponseMapper on ComicsResponse {
  List<Comic> toDomain() => this.data.results.map((it) => Comic(
    id: it.id,
    title: it.title,
    thumbnailURL: it.thumbnail.extension + it.thumbnail.extension,
    price: it.prices.first.price
  )).toList();
}

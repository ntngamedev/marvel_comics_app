import 'package:marvel_comics_app/api/contracts/response/comics_response.dart';
import 'package:marvel_comics_app/app/ui/home/models/comic_ui.dart';
import 'package:marvel_comics_app/domain/entities/comic.dart';

extension ComicsResponseMapper on ComicsResponse {
  List<Comic> toDomain() => this.data.results.map((it) => Comic(
    id: it.id,
    title: it.title,
    thumbnailURL:  "${it.thumbnail.path.replaceAll("http", "https") }/portrait_uncanny.${it.thumbnail.extension}",
    price: it.prices.first.price
  )).toList();
}

extension ComicsMapper on Comic {

  ComicUI toUI() => ComicUI(
    id: this.id,
    title: this.title,
    thumbnailURL: this.thumbnailURL,
    price: this.price
  );
}
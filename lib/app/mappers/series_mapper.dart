import 'package:marvel_comics_app/api/contracts/response/series_response.dart';
import 'package:marvel_comics_app/app/ui/home/models/serie_ui.dart';
import 'package:marvel_comics_app/domain/entities/serie.dart';

extension SeriesResponseMapper on SeriesResponse {
  List<Serie> toDomain() => this.data.results.map((it) => Serie(
    id: it.id,
    title: it.title,
    thumbnailURL:  "${it.thumbnail.path.replaceAll("http", "https") }/portrait_uncanny.${it.thumbnail.extension}",
  )).toList();
}

extension SerieMapper on Serie {
  SerieUI toUI() => SerieUI(
    id: this.id,
    title: this.title,
    thumbnailURL: this.thumbnailURL,
  );
}
import 'package:flutter_triple/flutter_triple.dart';
import 'package:marvel_comics_app/app/mappers/series_mapper.dart';
import 'package:marvel_comics_app/app/ui/home/models/serie_ui.dart';
import 'package:marvel_comics_app/domain/usecases/series_use_case.dart';


class SeriesStore extends StreamStore<Exception, List<SerieUI>> {
  final SeriesUseCase _seriesUseCase;

  SeriesStore(this._seriesUseCase) : super([]);

  load() {
    execute(() async => (await _seriesUseCase.getSeries()).map((it) => it.toUI()).toList()); 
  }
}

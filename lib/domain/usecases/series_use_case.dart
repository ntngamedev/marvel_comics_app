import 'package:marvel_comics_app/domain/entities/serie.dart';
import 'package:marvel_comics_app/domain/repositories/series_repository.dart';

class SeriesUseCase {
  final SeriesRepository _seriesRepository;

  SeriesUseCase(this._seriesRepository);

  Future<List<Serie>> getSeries() => _seriesRepository.getSeries();
}

import 'package:marvel_comics_app/domain/entities/serie.dart';

abstract class SeriesRepository {
  Future<List<Serie>> getSeries();
}

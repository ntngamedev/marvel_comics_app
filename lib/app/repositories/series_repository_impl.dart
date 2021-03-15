import 'package:marvel_comics_app/api/clients/marvel_client.dart';
import 'package:marvel_comics_app/domain/entities/serie.dart';
import 'package:marvel_comics_app/domain/repositories/series_repository.dart';
import 'package:marvel_comics_app/app/mappers/series_mapper.dart';

class SeriesRepositoryImpl implements SeriesRepository {
  final MarvelClient _marvelClient;

  SeriesRepositoryImpl(this._marvelClient);

  @override
  Future<List<Serie>> getSeries() async => (await _marvelClient.getSeries()).toDomain();
  
}
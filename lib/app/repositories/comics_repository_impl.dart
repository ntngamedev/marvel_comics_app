import 'package:marvel_comics_app/api/clients/marvel_client.dart';
import 'package:marvel_comics_app/domain/entities/comic.dart';
import 'package:marvel_comics_app/domain/repositories/comics_repository.dart';
import 'package:marvel_comics_app/app/mappers/comics_mapper.dart';

class ComicsRepositoryImpl implements ComicsRepository {
  final MarvelClient _marvelClient;

  ComicsRepositoryImpl(this._marvelClient);

  @override
  Future<List<Comic>> getComics() async {
    final result = await _marvelClient.getComics();
    return result.toDomain();
  }
}

import 'package:marvel_comics_app/domain/entities/comic.dart';
import 'package:marvel_comics_app/domain/repositories/comics_repository.dart';

class ComicsUseCase {
  final ComicsRepository _comicsRepository;

  ComicsUseCase(this._comicsRepository);

  Future<List<Comic>> getComics() => _comicsRepository.getComics();
}

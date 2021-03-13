import 'package:marvel_comics_app/domain/entities/comic.dart';
import 'package:marvel_comics_app/domain/repositories/comics_repository.dart';

class ComicsUseCase {
  final ComicsRepository _repository;

  ComicsUseCase(this._repository);

  Future<List<Comic>> getComics() {
    return _repository.getComics();
  }
}

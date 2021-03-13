import 'package:marvel_comics_app/domain/entities/comic.dart';

abstract class ComicsRepository {
  Future<List<Comic>> getComics();
}

import 'package:flutter_triple/flutter_triple.dart';
import 'package:marvel_comics_app/app/ui/home/models/comic_ui.dart';
import 'package:marvel_comics_app/domain/usecases/comics_use_case.dart';
import 'package:marvel_comics_app/app/mappers/comics_mapper.dart';

class ComicsStore extends StreamStore<Exception, List<ComicUI>> {
  final ComicsUseCase _comicsUseCase;

  ComicsStore(this._comicsUseCase) : super([]);

  load() {
    execute(() async => (await _comicsUseCase.getComics()).map((it) => it.toUI()).toList()); 
  }
}

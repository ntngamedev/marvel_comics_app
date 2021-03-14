import 'package:marvel_comics_app/app/ui/common/app_presenter.dart';
import 'package:marvel_comics_app/app/ui/home/models/comic_ui.dart';
import 'package:marvel_comics_app/domain/entities/comic.dart';
import 'package:marvel_comics_app/domain/usecases/comics_use_case.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:marvel_comics_app/app/mappers/comics_mapper.dart';

class HomePresenter extends AppPresenter {
  final ComicsUseCase _useCase;

  HomePresenter(
    this._useCase,
  );

  final isLoadingComics = RxNotifier<bool>(false);
  final comicsList = RxNotifier<List<ComicUI>>([]);

  @override
  void init() {
    loadComics();
  }

  loadComics() async {
    comicsList.value.clear();
    isLoadingComics.value = true;

    comicsList.value.addAll((await _useCase.getComics()).map((it) => it.toUI()).toList());
    isLoadingComics.value = false;
  }
}

import 'package:marvel_comics_app/app/ui/common/app_presenter.dart';
import 'package:marvel_comics_app/app/ui/home/models/comic_ui.dart';
import 'package:marvel_comics_app/app/ui/home/models/serie_ui.dart';
import 'package:marvel_comics_app/domain/usecases/comics_use_case.dart';
import 'package:marvel_comics_app/domain/usecases/series_use_case.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:marvel_comics_app/app/mappers/comics_mapper.dart';
import 'package:marvel_comics_app/app/mappers/series_mapper.dart';

class HomePresenter extends AppPresenter {
  final ComicsUseCase _comicsUseCase;
  final SeriesUseCase _seriesUseCase;

  HomePresenter(this._comicsUseCase, this._seriesUseCase);

  final _isLoadingComics = RxNotifier<bool>(false);
  final _comicsList = RxNotifier<List<ComicUI>>([]);
  final _errorComicsList = RxNotifier<Exception>(null);
  final _isLoadingSeries = RxNotifier<bool>(false);
  final _seriesList = RxNotifier<List<SerieUI>>([]);
  final _errorSeriesList = RxNotifier<Exception>(null);

  bool get isLoadingComics => _isLoadingComics.value;
  List<ComicUI> get comicsList => _comicsList.value;
  bool get isErrorComicsList => (_errorComicsList.value != null);
  bool get isLoadingSeries => _isLoadingSeries.value;
  List<SerieUI> get seriesList => _seriesList.value;
  bool get isErrorSeriesList => (_errorSeriesList.value != null);

  @override
  void init() {
    loadComics();
    loadSeries();
  }

  loadComics() async {
    _comicsList.value.clear();
    _isLoadingComics.value = true;

    try {
      _comicsList.value.addAll((await _comicsUseCase.getComics()).map((it) => it.toUI()).toList());
    } catch (e) {
      _errorComicsList.value = e;
    } finally {
      _isLoadingComics.value = false;
    }
  }

  loadSeries() async {
    _seriesList.value.clear();
    _isLoadingSeries.value = true;

    try {
      _seriesList.value.addAll((await _seriesUseCase.getSeries()).map((it) => it.toUI()).toList());
    } catch (e) {
      _errorSeriesList.value = e;
    } finally {
      _isLoadingSeries.value = false;
    }
  }
}

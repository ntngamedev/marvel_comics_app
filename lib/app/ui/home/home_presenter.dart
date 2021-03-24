import 'package:marvel_comics_app/app/ui/common/app_presenter.dart';
import 'package:marvel_comics_app/app/ui/home/stores/comics_store.dart';
import 'package:marvel_comics_app/app/ui/home/stores/series_store.dart';

class HomePresenter extends AppPresenter {
  final ComicsStore _comicsStore;
  final SeriesStore _seriesStore;

  HomePresenter(this._comicsStore, this._seriesStore);

  ComicsStore get comicsStore => _comicsStore;
  SeriesStore get seriesStore => _seriesStore;

  @override
  void init() {
    _comicsStore.load();
    _seriesStore.load();
  }
}

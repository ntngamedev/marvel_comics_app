import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_comics_app/app/repositories/comics_repository_impl.dart';
import 'package:marvel_comics_app/app/repositories/series_repository_impl.dart';
import 'package:marvel_comics_app/app/ui/home/home_presenter.dart';
import 'package:marvel_comics_app/app/ui/home/home_view.dart';
import 'package:marvel_comics_app/app/ui/home/stores/comics_store.dart';
import 'package:marvel_comics_app/app/ui/home/stores/series_store.dart';
import 'package:marvel_comics_app/domain/usecases/comics_use_case.dart';
import 'package:marvel_comics_app/domain/usecases/series_use_case.dart';
class HomeModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    Bind((i) => ComicsUseCase(i())),
    Bind((i) => SeriesUseCase(i())),
    Bind((i) => ComicsStore(i())),
    Bind((i) => SeriesStore(i())),
    Bind((i) => HomePresenter(i(), i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => HomeView())
  ];
}
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_comics_app/app/repositories/comics_repository_impl.dart';
import 'package:marvel_comics_app/app/repositories/series_repository_impl.dart';
import 'package:marvel_comics_app/app/ui/home/home_presenter.dart';
import 'package:marvel_comics_app/app/ui/home/home_view.dart';
import 'package:marvel_comics_app/domain/usecases/comics_use_case.dart';
import 'package:marvel_comics_app/domain/usecases/series_use_case.dart';
class HomeModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    Bind.factory((i) => ComicsRepositoryImpl(i())),
    Bind.factory((i) => SeriesRepositoryImpl(i())),
    Bind((i) => ComicsUseCase(i())),
    Bind((i) => SeriesUseCase(i())),
    Bind((i) => HomePresenter(i(), i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => HomeView())
  ];
}
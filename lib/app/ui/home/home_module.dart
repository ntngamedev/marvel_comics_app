import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_comics_app/app/repositories/comics_repository_impl.dart';
import 'package:marvel_comics_app/app/ui/home/home_presenter.dart';
import 'package:marvel_comics_app/app/ui/home/home_view.dart';
import 'package:marvel_comics_app/domain/usecases/comics_use_case.dart';
class HomeModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    Bind.factory((i) => ComicsRepositoryImpl(i())),
    Bind((i) => ComicsUseCase(i())),
    Bind((i) => HomePresenter(i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => HomeView())
  ];
}
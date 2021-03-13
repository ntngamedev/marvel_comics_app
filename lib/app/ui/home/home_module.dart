import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_comics_app/app/ui/home/home_store.dart';
import 'package:marvel_comics_app/app/ui/home/home_view.dart';
class HomeModule extends Module {

  @override
  List<Bind<Object>> get binds => [
    Bind((i) => HomeStore(i()))
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_, __) => HomeView())
  ];
}
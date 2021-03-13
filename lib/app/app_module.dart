import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_comics_app/api/clients/marvel_api.dart';
import 'package:marvel_comics_app/app/app_constants.dart';
import 'package:marvel_comics_app/app/ui/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind.singleton((i) => Dio()),
    Bind.singleton((i) => MarvelAPI(i(), baseUrl: AppConstants.BASE_URL, publicKey: AppConstants.MARVEL_PUBLIC_KEY, privateKey: AppConstants.MARVEL_PRIVATE_KEY))
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: HomeModule())
  ];
}

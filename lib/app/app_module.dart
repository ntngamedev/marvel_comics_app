import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_comics_app/api/clients/marvel_client.dart';
import 'package:marvel_comics_app/app/repositories/comics_repository_impl.dart';
import 'package:marvel_comics_app/app/repositories/series_repository_impl.dart';
import 'package:marvel_comics_app/app/utils/app_constants.dart';
import 'package:marvel_comics_app/app/ui/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
    Bind.singleton((i) => Dio()),
    Bind.singleton((i) => MarvelClient(i(), baseUrl: AppConstants.BASE_URL, privateKey: AppConstants.MARVEL_PRIVATE_KEY, publicKey: AppConstants.MARVEL_PUBLIC_KEY)),
    Bind.factory((i) => ComicsRepositoryImpl(i())),
    Bind.factory((i) => SeriesRepositoryImpl(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: HomeModule())
  ];
}

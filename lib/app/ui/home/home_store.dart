import 'package:dio/dio.dart';
import 'package:rx_notifier/rx_notifier.dart';

import 'package:marvel_comics_app/api/clients/marvel_api.dart';

class HomeStore {
  final MarvelAPI _api;
  
  HomeStore(
    this._api,
  );

  final _counter = RxNotifier<int>(0);
  get counter => _counter.value;

  increment() async {
    final result = await _api.getComics();

    print(result.data.results.length);

    _counter.value++;
  }
}

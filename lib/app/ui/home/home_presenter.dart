import 'package:marvel_comics_app/app/ui/app_presenter.dart';
import 'package:marvel_comics_app/domain/usecases/comics_use_case.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomePresenter extends AppPresenter {
  final ComicsUseCase _useCase;

  HomePresenter(
    this._useCase,
  );

  @override
  void init() async {
    print("Init");

    final result = await _useCase.getComics();
    print(result.length);
  }

  final _counter = RxNotifier<int>(0);
  get counter => _counter.value;

  increment() {
    _counter.value++;
  }
}

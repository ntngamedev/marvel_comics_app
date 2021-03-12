import 'package:rx_notifier/rx_notifier.dart';

class HomeStore {
  final _counter = RxNotifier<int>(0);
  get counter => _counter.value;

  increment() {
    _counter.value++;
  }
}

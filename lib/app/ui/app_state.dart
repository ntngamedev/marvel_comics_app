import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_comics_app/app/ui/app_presenter.dart';

abstract class AppState<TWidget extends StatefulWidget,
    TBind extends AppPresenter> extends State<TWidget> {

  final TBind _presenter = Modular.get<TBind>();
  TBind get presenter => _presenter;

  @override
  void initState() {
    super.initState();
    _presenter.init();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();

    if (Modular.dispose<TBind>()) {
      return;
    }

    _presenter.dispose();
  }
}

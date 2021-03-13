import 'package:flutter/material.dart';
import 'package:marvel_comics_app/app/ui/home/home_presenter.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../app_state.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends AppState<HomeView, HomePresenter> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RxBuilder(builder: (_) => Text("${presenter.counter}"))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: presenter.increment,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';
import 'package:marvel_comics_app/app/ui/home/home_presenter.dart';
import 'package:marvel_comics_app/app/ui/home/widgets/comic_card.dart';
import 'package:marvel_comics_app/app/utils/app_colors.dart';
import 'package:marvel_comics_app/app/utils/app_dimens.dart';
import 'package:marvel_comics_app/app/utils/app_styles.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../common/app_state.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends AppState<HomeView, HomePresenter> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Container(
        color: AppColors.primary,
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: AppDimens.materialBaselineGrid3x,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.materialBaselineGrid2x,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Comics", style: AppStyles.textBoldStyle16),
                    Text("See All", style: AppStyles.textStyle14Grey),
                  ],
                ),
              ),
              SizedBox(height: AppDimens.materialBaselineGrid3x),
              Expanded(
                flex: 5,
                child: RxBuilder(builder: (_) {
                  if (presenter.isLoadingComics.value) {
                    return Center(child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
                    ));
                  }

                  return Container(
                    child: GFCarousel(
                      enableInfiniteScroll: true,
                      height: MediaQuery.of(context).size.height,
                      items: presenter.comicsList.value.map((comicUI) {
                        return ComicCard(comicUI: comicUI);
                      }).toList(),
                    ),
                  );
                }),
              ),
              Expanded(flex: 3, child: Container())
            ],
          ),
        ),
      ),
    );
  }
}
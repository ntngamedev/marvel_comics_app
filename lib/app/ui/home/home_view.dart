import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/getwidget.dart';
import 'package:marvel_comics_app/app/ui/common/widgets/app_circle_progress.dart';
import 'package:marvel_comics_app/app/ui/home/home_presenter.dart';
import 'package:marvel_comics_app/app/ui/home/widgets/comic_card.dart';
import 'package:marvel_comics_app/app/ui/home/widgets/serie_card.dart';
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
              SizedBox(height: AppDimens.materialBaselineGrid1_5x),
              Expanded(
                child: RxBuilder(builder: (_) {
                  if (presenter.isLoadingComics) {
                    return Center(child: AppCircleProgress());
                  }

                  if (presenter.isErrorComicsList) {
                    return Center(
                      child: Text(
                        "Error in fletch data.",
                        style: AppStyles.textBoldStyle16,
                      ),
                    );
                  }

                  return Container(
                    child: GFCarousel(
                      enableInfiniteScroll: true,
                      height: MediaQuery.of(context).size.height,
                      items: presenter.comicsList.map((comicUI) {
                        return ComicCard(comicUI: comicUI);
                      }).toList(),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: AppDimens.materialBaselineGrid4x,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.materialBaselineGrid2x,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("Series", style: AppStyles.textBoldStyle16),
                  ],
                ),
              ),
              SizedBox(height: AppDimens.materialBaselineGrid1_5x),
              Container(
                height: AppDimens.materialBaselineGrid15x,
                child: RxBuilder(builder: (_) {
                  if (presenter.isLoadingSeries) {
                    return Center(child: AppCircleProgress());
                  }

                  if (presenter.isErrorSeriesList) {
                    return Center(
                      child: Text(
                        "Error in fletch data.",
                        style: AppStyles.textBoldStyle16,
                      ),
                    );
                  }

                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: presenter.seriesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(left: (index == 0) ? AppDimens.materialBaselineGrid2x: 0.0),
                        child: SerieCard(serieUI: presenter.seriesList[index]),
                      );
                    },
                  );
                }),
              ),
              SizedBox(height: AppDimens.materialBaselineGrid2x),
            ],
          ),
        ),
      ),
    );
  }
}

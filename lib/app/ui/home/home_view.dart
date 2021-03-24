import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:getwidget/getwidget.dart';
import 'package:marvel_comics_app/app/ui/common/widgets/app_circle_progress.dart';
import 'package:marvel_comics_app/app/ui/home/home_presenter.dart';
import 'package:marvel_comics_app/app/ui/home/models/comic_ui.dart';
import 'package:marvel_comics_app/app/ui/home/models/serie_ui.dart';
import 'package:marvel_comics_app/app/ui/home/stores/comics_store.dart';
import 'package:marvel_comics_app/app/ui/home/stores/series_store.dart';
import 'package:marvel_comics_app/app/ui/home/widgets/comic_card.dart';
import 'package:marvel_comics_app/app/ui/home/widgets/serie_card.dart';
import 'package:marvel_comics_app/app/utils/app_colors.dart';
import 'package:marvel_comics_app/app/utils/app_dimens.dart';
import 'package:marvel_comics_app/app/utils/app_styles.dart';

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
                child: ScopedBuilder<ComicsStore, Exception, List<ComicUI>>(
                  store: presenter.comicsStore,
                  onLoading: (_) => Center(child: AppCircleProgress()),
                  onError: (_, error) {
                    return Center(
                      child: Text(
                        "Error in fletch data.",
                        style: AppStyles.textBoldStyle16,
                      ),
                    );
                  },
                  onState: (_, state) {
                    return Container(
                      child: GFCarousel(
                        enableInfiniteScroll: true,
                        height: MediaQuery.of(context).size.height,
                        items: presenter.comicsStore.state.map((comicUI) {
                          return ComicCard(comicUI: comicUI);
                        }).toList(),
                      ),
                    );
                  },
                ),
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
                child: ScopedBuilder<SeriesStore, Exception, List<SerieUI>>(
                  store: presenter.seriesStore,
                  onLoading: (_) => Center(child: AppCircleProgress()),
                  onError: (_, error) {
                    return Center(
                      child: Text(
                        "Error in fletch data.",
                        style: AppStyles.textBoldStyle16,
                      ),
                    );
                  },
                  onState: (_, state) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(left: (index == 0) ? AppDimens.materialBaselineGrid2x : 0.0),
                          child: SerieCard(serieUI: state[index]),
                        );
                      },
                    );
                  },
                ),
              ),
              SizedBox(height: AppDimens.materialBaselineGrid2x),
            ],
          ),
        ),
      ),
    );
  }
}

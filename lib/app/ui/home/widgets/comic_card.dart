import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marvel_comics_app/app/ui/home/models/comic_ui.dart';
import 'package:marvel_comics_app/app/utils/app_colors.dart';
import 'package:marvel_comics_app/app/utils/app_dimens.dart';
import 'package:marvel_comics_app/app/utils/app_styles.dart';

class ComicCard extends StatelessWidget {
  final ComicUI comicUI;

  const ComicCard({
    Key key,
    this.comicUI,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: AppDimens.materialBaselineGrid2x,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(
          AppDimens.materialBaselineGrid1x,
        ),
        child: Stack(children: [
          CachedNetworkImage(
            height: MediaQuery.of(context).size.height,
            imageUrl: comicUI.thumbnailURL,
            fit: BoxFit.fill,
          ),
          Positioned.fill(
            child: Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    AppColors.primaryDark.withOpacity(0),
                    AppColors.primaryDark.withOpacity(0),
                    AppColors.primaryDark.withOpacity(0),
                    AppColors.primaryDark.withOpacity(0),
                    AppColors.primaryDark.withOpacity(0.0),
                    AppColors.primaryDark.withOpacity(0.3),
                    AppColors.primaryDark.withOpacity(0.6),
                    AppColors.primaryDark.withOpacity(0.7),
                    AppColors.primaryDark.withOpacity(0.8),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
              left: AppDimens.materialBaselineGrid2x,
              right: AppDimens.materialBaselineGrid2x,
              bottom: AppDimens.materialBaselineGrid3x,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(comicUI.title, style: AppStyles.textBoldStyle16),
                  Text("${comicUI.price}\$", style: AppStyles.textStyle16),
                ],
              ))
        ]),
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: AppColors.primary,
          blurRadius: AppDimens.materialBaselineGrid0_5x,
        )
      ]),
    );
  }
}

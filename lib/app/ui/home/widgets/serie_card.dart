import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marvel_comics_app/app/ui/home/models/serie_ui.dart';
import 'package:marvel_comics_app/app/utils/app_dimens.dart';
import 'package:marvel_comics_app/app/utils/app_styles.dart';

class SerieCard extends StatelessWidget {
  final SerieUI serieUI;

  const SerieCard({
    Key key,
    this.serieUI,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: AppDimens.materialBaselineGrid13x,
        margin: EdgeInsets.only(
          right: AppDimens.materialBaselineGrid2x,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                AppDimens.materialBaselineGrid1x,
              ),
              child: CachedNetworkImage(
                width: AppDimens.materialBaselineGrid13x,
                height: AppDimens.materialBaselineGrid12x,
                imageUrl: serieUI.thumbnailURL,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: AppDimens.materialBaselineGrid1x),
            Text(
              serieUI.title,
              style: AppStyles.textStyle10,
              softWrap: false,
            )
          ],
        ));
  }
}

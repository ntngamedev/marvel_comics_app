import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:marvel_comics_app/app/utils/app_colors.dart';

class AppStyles {
    static var textStyle10 = textStyle14.copyWith(fontSize: 10.0);
    static var textStyle12 = textStyle14.copyWith(fontSize: 12.0);
    static var textStyle14 = TextStyle(color: AppColors.white, fontWeight: FontWeight.normal, fontSize: 14.0, decoration: TextDecoration.none);
    static var textStyle16 = textStyle14.copyWith(fontSize: 16.0);

    static var textStyle14Grey = textStyle14.copyWith(color: Colors.grey);
    static var textStyle16Grey = textStyle16.copyWith(color: Colors.grey);
    
    static var textBoldStyle14 = textStyle14.copyWith(fontWeight: FontWeight.bold);
    static var textBoldStyle16 = textBoldStyle14.copyWith(fontSize: 16.0);
}
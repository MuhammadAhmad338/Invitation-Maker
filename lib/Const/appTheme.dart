// app_theme.dart
import 'package:flutter/material.dart';
import 'package:invitation_maker/Const/colors.dart';
import 'package:invitation_maker/Const/const.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
      primarySwatch: CColors.greenColor,
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: Const.fontName);
}

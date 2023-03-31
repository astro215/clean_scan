import 'package:flutter/material.dart';
import 'package:project_nhk/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:project_nhk/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:project_nhk/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:project_nhk/src/utils/theme/widget_themes/text_theme.dart';


class TAppTheme {
  TAppTheme._();


  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.lightGreen,
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightTElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );



  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.lightGreen,
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    appBarTheme: AppBarTheme(),
    floatingActionButtonTheme: FloatingActionButtonThemeData(),
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkTElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,

  );
}
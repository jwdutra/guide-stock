import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:commons/theme/config_theme.dart';

class AppTheme {
  //
  AppTheme._();

  static final errorColor = CustomColors.error.color;
  static final InformationColor = CustomColors.info.color;
  static final warningColor = CustomColors.warning.color;
  static final successColor = CustomColors.success.color;
  static final textColor = CustomColors.text.color;

  static final leftRight = Space.leftRight.value;
  static final topBotton = Space.topBotton.value;
  static final top = Space.top.value;
  static final botton = Space.botton.value;
  static final between = Space.between.value;
  static final space = Space.spaceDefault.value;
  static final defaultPadding = Space.defaultPadding.value;

  static final sizeTextTitle = SizeFont.title;
  static final sizeTextSubtitle = SizeFont.subtitle;
  static final sizeTextBody = SizeFont.body;
  static final sizeTextButton = SizeFont.button.size;

  static final allRadius = SizeRadius.all.size;

  static const barLight = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,

    ///
    systemNavigationBarColor: Colors.white,
    systemNavigationBarDividerColor: Colors.grey,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: lightColors,

    scaffoldBackgroundColor: Colors.white,
    primaryTextTheme: TextTheme(subtitle1: TextStyle(fontSize: 16)),
    // App Bar
    appBarTheme: _appBarTheme(),
    // Cores padrões

    // Padrão de card
    cardTheme: _cardTheme(),
    // Padrão Dálogo
    dialogTheme: _dialogTheme(),
    //
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    //
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: new TextStyle(color: Colors.black45, fontSize: 16),
      //contentPadding: EdgeInsets.only(top: 8, left: 8),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      hintStyle: new TextStyle(color: Colors.black38),
      //prefixStyle: new TextStyle(color: primaryColor),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black45),
        borderRadius: BorderRadius.circular(10.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black38, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
      border: new OutlineInputBorder(
        //borderSide: new BorderSide(color: primaryColor, width: 1.0),
        borderRadius: BorderRadius.circular(10.0),
      ),
    ),
    //
    textTheme: TextTheme(
      subtitle1: TextStyle(
        color: Colors.black54,
        fontSize: 18.0,
      ),
      subtitle2: TextStyle(
        color: Colors.black45,
        fontSize: 17.0,
      ),
    ),
    //
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        //primary: AppTheme.primaryColor,
        //backgroundColor: Colors.transparent,
        side: BorderSide(
          //color: AppTheme.primaryColor,
          style: BorderStyle.solid,
          width: 1.0,
        ),
        textStyle: TextStyle(
          fontSize: 20,
        ),
      ),
    ),
    //
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        //primary: AppTheme.accentColor,
        backgroundColor: Colors.transparent,
        textStyle: TextStyle(
          fontSize: 20,
          //color: AppTheme.accentColor,
        ),
      ),
    ),
    //
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(allRadius),
        ),
        //primary: AppTheme.primaryColor,
        elevation: 1,
        textStyle: TextStyle(
          fontSize: sizeTextButton,
          color: lightColors.onPrimary,
        ),
      ),
    ),
  );

  static DialogTheme _dialogTheme() {
    return DialogTheme(
      elevation: 0,
      backgroundColor: Colors.white,
      contentTextStyle: TextStyle(color: Colors.black54, fontSize: 16),
      titleTextStyle: TextStyle(color: Colors.black87, fontSize: 20),
    );
  }

  static CardTheme _cardTheme() {
    return CardTheme(
      color: Colors.white,
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(Radius.circular(3.0)),
        //side: BorderSide(color: primary[50]!),
      ),
    );
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      elevation: 1,
      color: lightColors.primary.withOpacity(0.8),
      iconTheme: IconThemeData(
        color: lightColors.onPrimary,
      ),
      titleTextStyle: TextStyle(
        color: lightColors.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      ),
      actionsIconTheme: IconThemeData(
        size: 28.0,
        color: lightColors.onPrimary,
      ),
      toolbarTextStyle: TextTheme(
        subtitle1: TextStyle(
          color: lightColors.onPrimary,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ).bodyText2,
      /*
    titleTextStyle: TextTheme(
      subtitle1: TextStyle(
        //color: primaryColor,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    ).headline6,
    */
    );
  }

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      color: Colors.black,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: Colors.black,
    ),
    iconTheme: IconThemeData(
      color: Colors.white54,
    ),
    textTheme: TextTheme(
      subtitle1: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      subtitle2: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
  );

  static backButton(context) {
    return IconButton(
      icon: Icon(Icons.close, color: AppTheme.textColor),
      onPressed: () => Navigator.of(context).pop(),
    );
  }
}

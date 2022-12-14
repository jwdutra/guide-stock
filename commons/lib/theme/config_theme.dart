import 'package:flutter/material.dart';

enum CustomColors {
  warning(Color.fromARGB(255, 196, 169, 16)),
  info(Color.fromARGB(255, 16, 175, 196)),
  error(Color.fromARGB(255, 156, 14, 33)),
  success(Color.fromARGB(255, 19, 150, 24)),
  text(Color.fromARGB(255, 37, 37, 37));

  const CustomColors(this.color);

  final Color color;
}

enum Space {
  leftRight(16.0),
  topBotton(16.0),
  top(16.0),
  botton(16.0),
  between(8.0),
  spaceDefault(4.0),
  defaultPadding(8.0);

  const Space(this.value);

  final double value;
}

enum SizeFont {
  title(18.0),
  subtitle(15.0),
  body(16.0),
  header(16.0),
  button(18.0);

  const SizeFont(this.size);

  final double size;
}

enum SizeRadius {
  leftTop(8.0),
  leftRight(8.0),
  bottonLeft(8.0),
  bottonRight(8.0),
  all(8.0);

  const SizeRadius(this.size);

  final double size;
}

const lightColors = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF006972),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF8DF2FF),
  onPrimaryContainer: Color(0xFF001F23),
  secondary: Color(0xFF636100),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFEBE86E),
  onSecondaryContainer: Color(0xFF1D1D00),
  tertiary: Color(0xFF515E7D),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFD9E2FF),
  onTertiaryContainer: Color(0xFF0C1B36),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFAFDFD),
  onBackground: Color(0xFF191C1D),
  surface: Color(0xFFFAFDFD),
  onSurface: Color(0xFF191C1D),
  surfaceVariant: Color(0xFFDAE4E6),
  onSurfaceVariant: Color(0xFF3F484A),
  outline: Color(0xFF6F797A),
  onInverseSurface: Color(0xFFEFF1F1),
  inverseSurface: Color(0xFF2D3131),
  inversePrimary: Color(0xFF4ED8E8),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006972),
);

const darkColors = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF4ED8E8),
  onPrimary: Color(0xFF00363C),
  primaryContainer: Color(0xFF004F56),
  onPrimaryContainer: Color(0xFF8DF2FF),
  secondary: Color(0xFFCFCB55),
  onSecondary: Color(0xFF333200),
  secondaryContainer: Color(0xFF4B4900),
  onSecondaryContainer: Color(0xFFEBE86E),
  tertiary: Color(0xFFB9C6EA),
  onTertiary: Color(0xFF23304D),
  tertiaryContainer: Color(0xFF394664),
  onTertiaryContainer: Color(0xFFD9E2FF),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1D),
  onBackground: Color(0xFFE0E3E3),
  surface: Color(0xFF191C1D),
  onSurface: Color(0xFFE0E3E3),
  surfaceVariant: Color(0xFF3F484A),
  onSurfaceVariant: Color(0xFFBEC8CA),
  outline: Color(0xFF899294),
  onInverseSurface: Color(0xFF191C1D),
  inverseSurface: Color(0xFFE0E3E3),
  inversePrimary: Color(0xFF006972),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF4ED8E8),
);

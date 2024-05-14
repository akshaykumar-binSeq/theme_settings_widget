import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

class ThemeBuilder {
  ThemeBuilder._();
  static final ThemeBuilder _instance = ThemeBuilder._();

  factory ThemeBuilder() => _instance;

  ThemeData buildLightTheme(String theme, bool transparentAppbar) {
    List<Color> colors = getColors(theme);

    // Define your seed colors.
    Color primarySeedColor = colors[0];
    Color secondarySeedColor = colors[1];
    Color tertiarySeedColor = colors[2];

    final ColorScheme schemeLight = SeedColorScheme.fromSeeds(
      brightness: Brightness.light,
      primaryKey: primarySeedColor,
      secondaryKey: secondarySeedColor,
      tertiaryKey: tertiarySeedColor,
      tones: FlexTones.vivid(Brightness.light),
    );

    var themeData = ThemeData(
      colorScheme: schemeLight,
      //useMaterial3: true,
    );

    if (transparentAppbar) {
      themeData = themeData.copyWith(
          appBarTheme: AppBarTheme(
        //  color: themeData.primaryColor,
        backgroundColor: themeData.colorScheme.background,
        foregroundColor: themeData.colorScheme.primary,
        elevation: 0,
      ));
    }
    return themeData;
  }

  ThemeData buildDarkTheme (String theme, bool transparentAppbar){
    List<Color> colors = getColors(theme);

    // Define your seed colors.
    Color primarySeedColor = colors[0];
    Color secondarySeedColor = colors[1];
    Color tertiarySeedColor = colors[2];

    ColorScheme schemeDark = SeedColorScheme.fromSeeds(
      brightness: Brightness.dark,
      primaryKey: primarySeedColor,
      secondaryKey: secondarySeedColor,
      tertiaryKey: tertiarySeedColor,
      tones: FlexTones.vivid(Brightness.dark),
    ); 

    var themeData = ThemeData(
      colorScheme: schemeDark,
      //useMaterial3: true,
    );

    if (transparentAppbar) {
      themeData = themeData.copyWith(
          appBarTheme: AppBarTheme(
        //  color: themeData.primaryColor,
        backgroundColor: themeData.colorScheme.surfaceVariant,
        foregroundColor: themeData.colorScheme.primary,
        elevation: 0,
      ));
    }
    return themeData;
  } 

  ThemeMode getThemeMode(String mode) {
    return ThemeMode.values.byName(mode);
  }

  List<Color> getColors(String colorsString) {
    List<String> colorsData = colorsString.split('_');

    List<Color> colors = [];
    colors.add(Color(int.parse(colorsData[0])));
    colors.add(Color(int.parse(colorsData[1])));
    colors.add(Color(int.parse(colorsData[2])));

    return colors;
  }
}

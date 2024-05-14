// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:theme_settings_widget/view/home_screen.dart';
import 'package:theme_settings_widget/view/theme_settings_screen.dart';


class Routes {
  static const HOME_SCREEN = '/';
  static const THEME_SETTINGS_SCREEN = '/ThemeSettingsScreen';


  static final routes = [
    GetPage(
      name: HOME_SCREEN,
      page: () => const HomeScreen(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: THEME_SETTINGS_SCREEN,
      page: () =>  ThemeSettingsScreen(),
      transition: Transition.circularReveal,
      preventDuplicates: false,
    ),
   
  ];
}

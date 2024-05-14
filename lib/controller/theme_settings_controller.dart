

import 'package:get/get.dart';
import 'package:theme_settings_widget/model/theme_settings.dart';
import 'package:theme_settings_widget/service/theme_settings_service.dart';

class ThemeSettingsController extends GetxController {
  
  final ThemeSettingsService themeSettingsService;

  var settings = ThemeSettings();

  ThemeSettingsController({required this.themeSettingsService});

  @override
  void onInit() {
    settings =  themeSettingsService.loadSettings();
    super.onInit();
  }    

  void setMode(String mode) {
    settings.mode = mode;
    themeSettingsService.saveSettings(settings);
    update();
  }

  void setTheme(String theme) {
    settings.theme = theme;
    themeSettingsService.saveSettings(settings);
    update();
  }

  void setTransparentAppbar(bool val) {
    settings.transparentAppbar = val;
    themeSettingsService.saveSettings(settings);
    update();
  }
}
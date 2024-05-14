
import 'package:hive_flutter/hive_flutter.dart';
import 'package:theme_settings_widget/model/theme_settings.dart';
import 'package:theme_settings_widget/service/theme_settings_service.dart';

class HiveThemeSettingsService implements ThemeSettingsService {
  @override
  ThemeSettings loadSettings() {
     return Hive.box<ThemeSettings>('theme_settings_box')
            .get('theme_settings') ?? ThemeSettings();
  }

  @override
  void saveSettings(ThemeSettings settings) {
    Hive.box<ThemeSettings>('theme_settings_box')
        .put('theme_settings', settings);
  }

}


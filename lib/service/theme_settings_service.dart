
import 'package:theme_settings_widget/model/theme_settings.dart';

abstract class ThemeSettingsService {
  ThemeSettings loadSettings();
  void saveSettings(ThemeSettings settings);
}
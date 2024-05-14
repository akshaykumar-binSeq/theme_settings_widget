import 'package:hive_flutter/hive_flutter.dart';
import 'package:theme_settings_widget/model/theme_settings.dart';
import 'package:theme_settings_widget/service/theme_settings_adapter.dart';

Future<void> initHive() async {
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(ThemeSettingsAdapter());
  }
  await Hive.openBox<ThemeSettings>('theme_settings_box');
}

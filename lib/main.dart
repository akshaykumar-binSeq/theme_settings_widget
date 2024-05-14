import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_settings_widget/common/hive.dart';
import 'package:theme_settings_widget/controller/theme_settings_controller.dart';
import 'package:theme_settings_widget/routes.dart';
import 'package:theme_settings_widget/service/hive_theme_settings_service.dart';
import 'package:theme_settings_widget/view/home_screen.dart';
import 'package:theme_settings_widget/view/theme_builder.dart';

void main() async {
  await initHive();
  Get.put(ThemeSettingsController(
      themeSettingsService: HiveThemeSettingsService()));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeSettingsController>(
      builder: (controller) {
        String theme = controller.settings.theme;
        String mode = controller.settings.mode;
        bool transparentAppbar = controller.settings.transparentAppbar;
        return GetMaterialApp(
          theme: ThemeBuilder().buildLightTheme(theme, transparentAppbar),
          darkTheme: ThemeBuilder().buildDarkTheme(theme, transparentAppbar),
          themeMode: ThemeBuilder().getThemeMode(mode),
          home: const HomeScreen(),
          initialRoute: Routes.HOME_SCREEN,
          getPages: Routes.routes,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}

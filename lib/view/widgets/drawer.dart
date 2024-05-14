import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_settings_widget/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: isDarkMode
                  ? Theme.of(context).colorScheme.surfaceVariant
                  : Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'Menu',
              style: TextStyle(color: isDarkMode
                  ? Theme.of(context).colorScheme.onSurfaceVariant
                  : Theme.of(context).colorScheme.onPrimary,),
            ),
          ),
          ListTile(
            title: const Text('Theme settings'),
            onTap: () {
              Get.back();
              Get.toNamed(Routes.THEME_SETTINGS_SCREEN);
            },
          )
        ],
      ),
    );
  }
}

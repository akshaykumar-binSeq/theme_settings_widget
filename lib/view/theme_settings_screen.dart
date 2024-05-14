import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:theme_settings_widget/controller/theme_settings_controller.dart';
import 'package:theme_settings_widget/view/widgets/menu_items_builder.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ThemeSettingsScreen extends StatelessWidget {
  ThemeSettingsScreen({super.key});

  static const defaultTheme =
      '4280693304_4294278935_4278209856';
  ThemeSettingsController get themeSettingsController => Get.find();

  final itemList = MenuItemsBuilder().list;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    String theme = themeSettingsController.settings.theme;
    String mode = themeSettingsController.settings.mode;
    bool transparentAppbar = themeSettingsController.settings.transparentAppbar;
    int modeIndex = 0;
    if ('system' == mode) modeIndex = 1;
    if ('dark' == mode) modeIndex = 2;

    int transparentAppbarIndex = transparentAppbar ? 0 : 1;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: BackButton(
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Theme settings',
          style: TextStyle(fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Card(
          elevation: 3,
          shadowColor: Theme.of(context).colorScheme.onPrimary,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Lighting mode:',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MouseRegion(
                    cursor: MaterialStateMouseCursor.clickable,
                    child: ToggleSwitch(
                      minWidth: 90.0,
                      initialLabelIndex: modeIndex,
                      cornerRadius: 20.0,
                      activeFgColor: Theme.of(context).colorScheme.onPrimary,
                      inactiveBgColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      inactiveFgColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      dividerColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      totalSwitches: 3,
                      labels: const ['Day', 'Sys.', 'Night'],
                      icons: const [Icons.sunny, Icons.phone_android, Icons.mode_night],
                      animate: true,
                      activeBgColors: [
                        [Theme.of(context).colorScheme.primary],
                        [Theme.of(context).colorScheme.primary],
                        [Theme.of(context).colorScheme.primary],
                      ],
                      onToggle: (index) {
                        String value = 'light';
                        if (index == 1) value = 'system';
                        if (index == 2) value = 'dark';
                        themeSettingsController.setMode(value);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Color theme:',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 270,
                    height: 60,
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                            value: theme,
                            icon: Icon(
                              Icons.arrow_drop_down,
                              color: primaryColor,
                            ),
                            elevation: 16,
                            style: TextStyle(color: primaryColor),
                            underline: Container(
                              height: 2,
                              color: primaryColor,
                            ),
                            onChanged: (String? value) {
                              themeSettingsController.setTheme(value!);
                            },
                            items: itemList),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                 
                  ElevatedButton(onPressed: (){
                    themeSettingsController.setTheme(defaultTheme);
                  }, child: const Text('Reset')), 
                  const SizedBox(
                    height: 70,
                  ),
                  Text(
                    'Transparent appbar:',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.secondary),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MouseRegion(
                    cursor: MaterialStateMouseCursor.clickable,
                    child: ToggleSwitch(
                      minWidth: 100.0,
                      initialLabelIndex: transparentAppbarIndex,
                      cornerRadius: 20.0,
                      activeFgColor: Theme.of(context).colorScheme.onPrimary,
                      inactiveBgColor:
                          Theme.of(context).colorScheme.primaryContainer,
                      inactiveFgColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      dividerColor:
                          Theme.of(context).colorScheme.onPrimaryContainer,
                      animate: true,
                      totalSwitches: 2,
                      labels: const ['Yes', 'No'],
                      icons: const [
                        Icons.thumb_up,
                        Icons.thumb_down,
                      ],
                      activeBgColors: [
                        [Theme.of(context).colorScheme.primary],
                        [Theme.of(context).colorScheme.primary],
                      ],
                      onToggle: (index) {
                        bool value = index == 0 ? true : false;
                        themeSettingsController.setTransparentAppbar(value);
                      },
                    ),
                  ),
                   const SizedBox(
                    height: 200,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //
}

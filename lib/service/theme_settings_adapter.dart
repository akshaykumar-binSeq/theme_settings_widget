

import 'package:hive_flutter/hive_flutter.dart';
import 'package:theme_settings_widget/model/theme_settings.dart';

class ThemeSettingsAdapter extends TypeAdapter<ThemeSettings> {
  @override
  final typeId = 0;

  @override
  ThemeSettings read(BinaryReader reader) {
    return ThemeSettings.fromJson(Map<String, dynamic>.from(reader.read()));
  }

  @override
  void write(BinaryWriter writer, ThemeSettings obj) {
    writer.write(obj.toJson());
  }
}
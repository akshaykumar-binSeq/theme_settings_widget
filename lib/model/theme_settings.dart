class ThemeSettings {
  String mode = 'light';
  String theme = '4280693304_4294278935_4278209856';
  bool transparentAppbar = false;

  ThemeSettings();

  ThemeSettings.fromJson(Map<String, dynamic> json)
      : mode = json['mode'] as String,
        theme = json['theme'] as String,
        transparentAppbar = json['transparentAppbar'] as bool;

  Map<String, dynamic> toJson() =>
      {'mode': mode, 'theme': theme, 'transparentAppbar': transparentAppbar};
}

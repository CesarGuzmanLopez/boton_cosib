import 'package:boton_cosib/src/model/user.dart';
import 'package:boton_cosib/src/preferences/UserPreferences.dart';
import 'package:boton_cosib/src/views/settings/settings_service.dart';
import 'package:flutter/material.dart';

class SettingsController with ChangeNotifier {
  SettingsController(this._settingsService, this._userPreferences);

  final SettingsService _settingsService;
  final UserPreferences _userPreferences;
  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  User? _user;
  User? get user => _user;

  Future<void> loadSettings() async {
    _themeMode = await _settingsService.themeMode();
    _user = await _userPreferences.getUser();
    notifyListeners();
  }

  Future<void> updateThemeMode(ThemeMode? newThemeMode) async {
    if (newThemeMode == null) return;
    if (newThemeMode == _themeMode) return;

    _themeMode = newThemeMode;
    notifyListeners();
    await _settingsService.updateThemeMode(newThemeMode);
  }

  Future<void> updateUser(User user) async {
    _user = user;
    notifyListeners();
    await _userPreferences.saveUser(user);
  }
}

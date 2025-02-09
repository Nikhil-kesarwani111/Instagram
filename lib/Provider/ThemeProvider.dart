import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier with WidgetsBindingObserver {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    detectSystemTheme(); // Detect on app start
    WidgetsBinding.instance.addObserver(this); // Listen for theme changes
  }

  @override
  void didChangePlatformBrightness() {
    detectSystemTheme(); // Update theme when system theme changes
  }

  void detectSystemTheme() {
    var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    _themeMode = brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this); // Clean up listener
    super.dispose();
  }
}

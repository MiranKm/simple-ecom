import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{

  ThemeMode _mode;

  ThemeProvider():_mode = ThemeMode.light;



  set theme(ThemeMode themeMode) {
    _mode = themeMode;
    notifyListeners();
  }

  ThemeMode get theme{
    return _mode;
  }


}
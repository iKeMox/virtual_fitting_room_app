import 'package:flutter/material.dart';
import 'package:graduation_project_fitting_app/features/favourite/pages/favourite_view.dart';

import 'features/fitting_room/pages/fitting_room_view.dart';
import 'features/home/pages/home_view.dart';
import 'features/settings/pages/settings_view.dart';

class SettingsProvider extends ChangeNotifier{
  ThemeMode currentTheme = ThemeMode.light;
  int currentIndex = 0;
  List<Widget> screens = [
    HomeView(),
    FittingRoomView(),
    FavouriteView(),
    SettingsView(),
  ];

  bool isDark(){
    return currentTheme == ThemeMode.light;
  }
  changeTheme(ThemeMode newTheme){
    if(newTheme == currentTheme) return;
    currentTheme = newTheme;
    notifyListeners();
  }
  changeIndex(int newIndex){
    currentIndex = newIndex;
    notifyListeners();
  }
}
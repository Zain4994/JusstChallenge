
import 'package:jusst_challenge/src/resources/app_contstants.dart';
import 'package:jusst_challenge/src/screens/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.HomeScreen:
        return CupertinoPageRoute(
            builder: (_) => HomeScreen(),
            settings: RouteSettings(name: RoutePaths.HomeScreen));
    }
  }
}

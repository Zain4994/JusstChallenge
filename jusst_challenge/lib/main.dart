import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:jusst_challenge/src/jusst_challenge_app.dart';
import 'package:shared_preferences/shared_preferences.dart';


main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  List languages = await Devicelocale.preferredLanguages;

  runApp(JusstChallangeApp(
      sharedPreferences,
      languages));
}

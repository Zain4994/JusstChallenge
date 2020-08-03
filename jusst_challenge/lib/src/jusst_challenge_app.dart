import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jusst_challenge/src/core/app_localizations.dart';
import 'package:jusst_challenge/src/providers/providers_setup.dart';
import 'package:jusst_challenge/src/resources/app_contstants.dart';
import 'package:jusst_challenge/src/resources/colors_palette.dart';
import 'package:jusst_challenge/src/router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JusstChallangeApp extends StatelessWidget {
  final SharedPreferences sharedPreferences;

  final List languages;

  const JusstChallangeApp(this.sharedPreferences, this.languages);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders(sharedPreferences),
      child: MaterialApp(
        builder: BotToastInit(),
        title: 'Test App',
        themeMode: ThemeMode.light,
        // Change it as you want
        theme: ThemeData(
            fontFamily: 'HelveticaNeue',
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: JusstChallangeAppColor.Grey.getColor()),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: JusstChallangeAppColor.Blue.getColor())),
            ),
            primaryColor: Colors.white,
            primaryColorBrightness: Brightness.light,
            brightness: Brightness.light,
            primaryColorDark: Colors.black,
            canvasColor: Colors.white,
            // next line is important!
            appBarTheme: AppBarTheme(brightness: Brightness.light)),
        darkTheme: ThemeData(
            fontFamily: 'HelveticaNeue',
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(color: JusstChallangeAppColor.Grey.getColor()),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: JusstChallangeAppColor.Blue.getColor())),
            ),
            primaryColor: Colors.black,
            primaryColorBrightness: Brightness.dark,
            primaryColorLight: Colors.black,
            brightness: Brightness.dark,
            primaryColorDark: Colors.black,
            indicatorColor: Colors.white,
            canvasColor: Colors.black,
            // next line is important!
            appBarTheme: AppBarTheme(brightness: Brightness.dark)),
        initialRoute: RoutePaths.HomeScreen,
        onGenerateRoute: Router.generateRoute,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''),
        ],
        localeListResolutionCallback: selectAppLanguage,
      ),
    );
  }

  ///Selects the first suitable supported app language
  Locale selectAppLanguage(locales, supportedLocales) {
    for (dynamic language in languages) {
      for (Locale supportedLocale in supportedLocales) {
        if (language.toString().contains(supportedLocale.languageCode))
          return supportedLocale;
      }
    }
    return supportedLocales.first;
  }
}

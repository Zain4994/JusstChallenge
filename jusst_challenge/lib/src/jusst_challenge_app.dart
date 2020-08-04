import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:jusst_challenge/src/core/app_localizations.dart';
import 'package:jusst_challenge/src/providers/providers_setup.dart';
import 'package:jusst_challenge/src/resources/app_contstants.dart';
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
        title: 'Jusst Challange App',
        themeMode: ThemeMode.light,
        // Change it as you want
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

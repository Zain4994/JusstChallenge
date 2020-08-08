import 'package:flutter/cupertino.dart';
import 'package:jusst_challenge/src/core/local_storage_provider.dart';
import 'package:jusst_challenge/src/core/repository.dart';
import 'package:jusst_challenge/src/core/resources_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<SingleChildWidget> appProviders(SharedPreferences sharedPreferences) {
  return [
    ...independentServices(sharedPreferences),
    ...dependentServices(),
    ...uiConsumableProviders,
  ];
}

List<SingleChildWidget> independentServices(
    SharedPreferences sharedPreferences) {
  return [
    Provider(create: (BuildContext context) => ResourcesProvider()),
    Provider(create: (_) => LocalStorageProvider(sharedPreferences)),
  ];
}

List<SingleChildWidget> dependentServices() => [

  Provider<Repository>(
    create: (BuildContext context) {
      return Repository(Provider.of(context, listen: false));
    },
  ),
];

List<SingleChildWidget> uiConsumableProviders = [];

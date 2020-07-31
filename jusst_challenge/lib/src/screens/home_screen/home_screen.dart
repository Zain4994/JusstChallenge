import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jusst_challenge/src/core/base_widget.dart';
import 'package:provider/provider.dart';
import 'package:jusst_challenge/src/screens/home_screen/home_screen_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeScreenModel>(
      model: HomeScreenModel(Provider.of(context, listen: false)),
      onModelReady: (model, context) async {
      },
      widgetBuilder:
          (BuildContext context, HomeScreenModel model, Widget child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            color: Colors.red,
          ),
        );
      },
    );
  }
}

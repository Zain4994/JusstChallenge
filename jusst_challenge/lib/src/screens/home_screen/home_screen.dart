import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jusst_challenge/src/core/base_widget.dart';
import 'package:jusst_challenge/src/screens/home_screen/home_screen_model.dart';
import 'package:jusst_challenge/src/ui_component/jusst_challenge_overlay.dart';
import 'package:jusst_challenge/src/ui_component/meta_data_view.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<HomeScreenModel>(
      model: HomeScreenModel(Provider.of(context, listen: false)),
      onModelReady: (model, context) async {
        model.initData();
      },
      widgetBuilder:
          (BuildContext context, HomeScreenModel model, Widget child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                MetaDataView(model.currentMetaData, model.currentPlaybackState),
                JusstChallengeOverlay(
                    model.resourcesProvider
                        .getString(context, "system_is_not_ready"),
                    model.currentSystemState),
              ],
            ),
          ),
        );
      },
    );
  }
}

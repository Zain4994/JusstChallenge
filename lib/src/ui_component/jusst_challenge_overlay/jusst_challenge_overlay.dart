import 'package:flutter/material.dart';
import 'package:jusst_challenge/src/core/base_widget.dart';
import 'package:jusst_challenge/src/models/state.dart';
import 'package:jusst_challenge/src/screens/home_screen/home_screen.dart';
import 'package:jusst_challenge/src/ui_component/jusst_challenge_overlay/jusst_challenge_overlay_model.dart';
import 'package:provider/provider.dart';

enum OverlayType { System, Volume }

class JusstChallengeOverlay extends StatelessWidget {
  /// Overlay center text string value.
  final String text;

  /// The system state to determine show/hide the overlay.
  final SystemState systemState;

  /// The volume value coming from current state in the [HomeScreen].
  final int volume;

  /// Determine overlay type.
  final OverlayType overlayType;

  JusstChallengeOverlay(
      {this.text, this.systemState, this.volume, this.overlayType});

  @override
  Widget build(BuildContext context) {
    return BaseWidget<JusstChallengeOverlayModel>(
      model: JusstChallengeOverlayModel(Provider.of(context, listen: false)),
      widgetBuilder: (BuildContext context, JusstChallengeOverlayModel model,
          Widget child) {
        if (overlayType == OverlayType.System) {
          return _buildOverlay(MediaQuery.of(context).size.width, text,
              systemState != SystemState.ready, overlayType);
        } else {
          if(volume != null && model.currentVolume != volume){
            model.setCurrentVolume(volume);
          }
          return _buildOverlay(150, text + " " + model.currentVolume.toString(), !model.shouldShowVolumeOverlay, overlayType);
        }
      },
    );
  }

  /// Build the main overlay view.
  Widget _buildOverlay(double width, String text, bool isVisible, OverlayType overlayType) {
    return Visibility(
      visible: isVisible,
      child: Align(
        alignment: overlayType == OverlayType.System ? AlignmentDirectional.bottomCenter : AlignmentDirectional.topCenter ,
        child: Container(
          height: 100,
          width: width,
          margin: EdgeInsets.symmetric(horizontal: 20),
          alignment: AlignmentDirectional.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.all(Radius.circular(22)),
          ),
          child: Text(
            text,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}

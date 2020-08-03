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
          return _buildOverlay(200, MediaQuery.of(context).size.width, text,
              systemState != SystemState.ready);
        } else {
          if(volume != null && model.currentVolume != volume){
            model.setCurrentVolume(volume);
          }
          return _buildOverlay(
              100, 100, volume.toString(), !model.shouldShowVolumeOverlay);
        }
      },
    );
  }

  /// Build the main overlay view.
  Widget _buildOverlay(
      double height, double width, String text, bool isVisible) {
    return Visibility(
      visible: isVisible,
      child: Container(
        height: height,
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
    );
  }
}

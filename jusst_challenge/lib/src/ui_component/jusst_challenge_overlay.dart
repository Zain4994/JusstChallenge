import 'package:flutter/material.dart';
import 'package:jusst_challenge/src/models/state.dart';

class JusstChallengeOverlay extends StatelessWidget {

  /// Overlay center text string value.
  final String text;

  /// The system state to determine show/hide the overlay.
  final SystemState systemState;

  JusstChallengeOverlay(this.text, this.systemState);

  @override
  Widget build(BuildContext context) {
    if (systemState != null &&
        systemState == SystemState.ready) {
      return Container();
    } else {
      return Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
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
      );
    }
  }
}


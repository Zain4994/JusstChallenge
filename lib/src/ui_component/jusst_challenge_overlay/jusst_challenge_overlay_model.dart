
import 'dart:async';

import 'package:jusst_challenge/src/core/base_model.dart';
import 'package:jusst_challenge/src/core/resources_provider.dart';

class JusstChallengeOverlayModel extends BaseModel {
  JusstChallengeOverlayModel(ResourcesProvider resourcesProvider)
      : super(resourcesProvider);

  /// Save current volume value.
  var _currentVolume;

  /// Get current volume value.
  get currentVolume => _currentVolume;

  /// A boolean value to determine show/hide volume overlay.
  get shouldShowVolumeOverlay => _currentVolume == null;

  /// The duration length to hide volume overlay.
  var duration = Duration(seconds: 3);

  /// A timer to countdown the [duration] and hide volume overlay.
  Timer timer;

  /// Hide volume overlay after 3 seconds.
  void hideVolumeOverlay(){
    timer?.cancel();

    timer = Timer(duration, () {
      _currentVolume = null;
      notifyListeners();
    });
  }

  /// Set [_currentVolume] value for every screen rebuild.
  void setCurrentVolume(int value){
    _currentVolume = value;
    hideVolumeOverlay();
  }

}

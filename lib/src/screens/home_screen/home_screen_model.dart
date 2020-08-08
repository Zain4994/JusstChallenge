import 'dart:convert';

import 'package:jusst_challenge/src/core/base_model.dart';
import 'package:jusst_challenge/src/core/resources_provider.dart';
import 'package:jusst_challenge/src/models/metadata.dart';
import 'package:jusst_challenge/src/models/state.dart';
import 'package:jusst_challenge/src/screens/home_screen/home_screen.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomeScreenModel extends BaseModel {
  HomeScreenModel(ResourcesProvider resourcesProvider)
      : super(resourcesProvider);

  /// Init [IOWebSocketChannel] to connect with jusst challenge url.
  var channel =
  IOWebSocketChannel.connect("wss://challenge.jusst.engineering/ws");

  /// The current [State] coming from [WebSocketChannel].
  State _currentState;

  /// System state value inside the coming [State].
  SystemState _currentSystemState;

  /// Get [_currentSystemState] value to use it in [HomeScreen].
  get currentSystemState => _currentSystemState;

  /// Meta data value inside the coming [State].
  MetaDataModel _currentMetaData;

  /// Get [_currentMetaData] value to use it in [HomeScreen].
  get currentMetaData => _currentMetaData;

  /// Playback state value inside the coming [State].
  PlaybackState _currentPlaybackState;

  /// Get [_currentPlaybackState] value to use it in [HomeScreen].
  get currentPlaybackState => _currentPlaybackState;

  /// Volume value inside the coming [State].
  int _currentVolume;

  /// Get [_currentVolume] value to use it in [HomeScreen].
  get currentVolume => _currentVolume;

  /// Playback position value inside the coming [State].
  int _playbackPosition;

  /// Get [_playbackPosition] value to use it in [HomeScreen].
  get playbackPosition => _playbackPosition;

  /// Init the [IOWebSocketChannel] to listen from specific url.
  /// Save every message coming in the socket as a [State].
  void initData() {
    channel.stream.listen((message) {
      // Save every message as a [State].
      _currentState = State.fromJson(jsonDecode(message));

      // Save the system state.
      if (_currentState.system != null) {
        _currentSystemState = _currentState.system;
      }

      // Save the metadata.
      if (_currentState.metadata != null) {
        _currentMetaData = _currentState.metadata;
      }

      // Save the playback state.
      if (_currentState.playback != null) {
        _currentPlaybackState = _currentState.playback;
      }

      // Save the volume.
      _currentVolume = _currentState.volume;

      // Save the playback Position.
      if (_currentState.playbackPosition != null) {
        _playbackPosition = _currentState.playbackPosition;
      }

      // Rebuild the screen.
      notifyListeners();
    });
  }

}

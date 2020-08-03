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

  void initData() {
    channel.stream.listen((message) {
      _currentState = State.fromJson(jsonDecode(message));

      if (_currentState.system != null) {
        _currentSystemState = _currentState.system;
      }

      if (_currentState.metadata != null) {
        _currentMetaData = _currentState.metadata;
      }

      if (_currentState.playback != null) {
        _currentPlaybackState = _currentState.playback;
      }

      _currentVolume = _currentState.volume;

      print("------------------------------------");
      print(message);
      print("playback is: ${_currentState.playback}");
      print("system is: ${_currentState.system}");
      print("volume is: ${_currentState.volume}");
      print("playbackPosition is: ${_currentState.playbackPosition}");
      print("metadata is: ${_currentState.metadata}");
      print("metadata title is: ${_currentState.metadata?.title}");
      print("metadata artist is: ${_currentState.metadata?.artist}");
      print("metadata coverArt is: ${_currentState.metadata?.coverArt}");
      print("metadata duration is: ${_currentState.metadata?.duration}");

      notifyListeners();
    });
  }

}

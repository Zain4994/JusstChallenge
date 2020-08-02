import 'dart:convert';

import 'package:jusst_challenge/src/core/base_model.dart';
import 'package:jusst_challenge/src/core/resources_provider.dart';
import 'package:jusst_challenge/src/models/state.dart';
import 'package:web_socket_channel/io.dart';

enum HomeScreenType { all, favorite }

class HomeScreenModel extends BaseModel {
  HomeScreenModel(ResourcesProvider resourcesProvider)
      : super(resourcesProvider);

  State currentState;

  var channel = IOWebSocketChannel.connect("wss://challenge.jusst.engineering/ws");

  void initData(){
    channel.stream.listen((message) {
      print("------------------------------------");
      print(message);
      currentState = State.fromJson(jsonDecode(message));
      print("playback is: ${currentState.playback}");
      print("system is: ${currentState.system}");
      print("volume is: ${currentState.volume}");
      print("playbackPosition is: ${currentState.playbackPosition}");
      print("metadata is: ${currentState.metadata}");
      print("metadata title is: ${currentState.metadata?.title}");
      print("metadata artist is: ${currentState.metadata?.artist}");
      print("metadata coverArt is: ${currentState.metadata?.coverArt}");
      print("metadata duration is: ${currentState.metadata?.duration}");

      notifyListeners();
    });
  }
}

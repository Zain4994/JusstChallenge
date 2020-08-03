import 'package:jusst_challenge/src/models/metadata.dart';

import 'package:flutter/material.dart';
import 'package:jusst_challenge/src/models/state.dart';

class MetaDataView extends StatelessWidget {

  /// The [MetaDataModel] data to show in the view.
  final MetaDataModel metaData;

  /// The [PlaybackState] to display play/pause icon.
  /// if the value is [PlaybackState.inactive] there is no icon to show.
  final PlaybackState playbackState;

  MetaDataView(this.metaData, this.playbackState);

  @override
  Widget build(BuildContext context) {
    if (metaData != null &&
        metaData.coverArt != null) {
      return Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Expanded(
                child: Image.network(
                  metaData.coverArt,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                      ),
                    );
                  },
                )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                metaData.artist +
                    " - " +
                    metaData.title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            _buildPlaybackArrow(),
          ],
        ),
      );
    } else {
      return Container();
    }
  }

  Widget _buildPlaybackArrow() {
    if (playbackState != null && playbackState != PlaybackState.inactive) {
      return Icon(
        playbackState == PlaybackState.paused
            ? Icons.play_circle_outline
            : Icons.pause_circle_outline,
        color: Colors.white,
      );
    } else {
      return Container();
    }
  }
}


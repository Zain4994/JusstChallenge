import 'package:json_annotation/json_annotation.dart';

part 'metadata.g.dart';

@JsonSerializable(includeIfNull: false)
class MetaDataModel {
  final String title;
  final String artist;
  final String coverArt;
  final int duration;

  MetaDataModel({this.title, this.artist, this.coverArt, this.duration});

  factory MetaDataModel.fromJson(Map<String, dynamic> json) =>
      _$MetaDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$MetaDataModelToJson(this);
}
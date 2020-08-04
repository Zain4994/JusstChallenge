// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaDataModel _$MetaDataModelFromJson(Map<String, dynamic> json) {
  return MetaDataModel(
    title: json['title'] as String,
    artist: json['artist'] as String,
    coverArt: json['coverArt'] as String,
    duration: json['duration'] as int,
  );
}

Map<String, dynamic> _$MetaDataModelToJson(MetaDataModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('artist', instance.artist);
  writeNotNull('coverArt', instance.coverArt);
  writeNotNull('duration', instance.duration);
  return val;
}

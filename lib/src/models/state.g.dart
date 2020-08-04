// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

State _$StateFromJson(Map<String, dynamic> json) {
  return State(
    system: _$enumDecodeNullable(_$SystemStateEnumMap, json['system']),
    playback: _$enumDecodeNullable(_$PlaybackStateEnumMap, json['playback']),
    volume: json['volume'] as int,
    bluetooth: _$enumDecodeNullable(_$BluetoothStateEnumMap, json['bluetooth']),
    metadata: json['metadata'] == null
        ? null
        : MetaDataModel.fromJson(json['metadata'] as Map<String, dynamic>),
    playbackPosition: json['playbackPosition'] as int,
  );
}

Map<String, dynamic> _$StateToJson(State instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('system', _$SystemStateEnumMap[instance.system]);
  writeNotNull('playback', _$PlaybackStateEnumMap[instance.playback]);
  writeNotNull('volume', instance.volume);
  writeNotNull('bluetooth', _$BluetoothStateEnumMap[instance.bluetooth]);
  writeNotNull('metadata', instance.metadata?.toJson());
  writeNotNull('playbackPosition', instance.playbackPosition);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$SystemStateEnumMap = {
  SystemState.booting: 'booting',
  SystemState.updating: 'updating',
  SystemState.error: 'error',
  SystemState.ready: 'ready',
};

const _$PlaybackStateEnumMap = {
  PlaybackState.inactive: 'inactive',
  PlaybackState.paused: 'paused',
  PlaybackState.playing: 'playing',
};

const _$BluetoothStateEnumMap = {
  BluetoothState.inactive: 'inactive',
  BluetoothState.pairing: 'pairing',
  BluetoothState.connected: 'connected',
};

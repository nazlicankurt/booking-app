// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) => RoomModel(
      roomType: json['roomType'] as String,
      adultCount: (json['adultCount'] as num).toInt(),
      childCount: (json['childCount'] as num).toInt(),
    );

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'roomType': instance.roomType,
      'adultCount': instance.adultCount,
      'childCount': instance.childCount,
    };

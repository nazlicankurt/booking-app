import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/room_entity.dart';

part 'room_model.g.dart';
@JsonSerializable()
class RoomModel extends RoomEntity {
  const RoomModel({
    required super.roomType,
    required super.adultCount,
    required super.childCount,
  });

  factory RoomModel.fromJson(Map<String, dynamic> json) {
    return RoomModel(
      roomType: json['name'] as String? ?? '',  
      adultCount: json['adult-count'] as int? ?? 0,
      childCount: json['children-count'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);

  factory RoomModel.empty() {
    return RoomModel(
      roomType: '',
      adultCount: 0,
      childCount: 0,
    );
  }
}

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/room_entity.dart';

part 'room_model.g.dart';

@JsonSerializable()
class RoomModel extends RoomEntity {
  const RoomModel({
    required String roomType,
    required int adultCount,
    required int childCount,
  }) : super(
          roomType: roomType,
          adultCount: adultCount,
          childCount: childCount,
        );

  factory RoomModel.fromJson(Map<String, dynamic> json) => _$RoomModelFromJson(json);

  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
  factory RoomModel.empty() { 
  return RoomModel( 
    roomType: '', 
    adultCount: 0, 
    childCount: 0, 
  );
}
}


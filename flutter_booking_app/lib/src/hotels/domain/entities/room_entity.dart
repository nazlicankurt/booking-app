import 'package:equatable/equatable.dart';

class RoomEntity extends Equatable {
  final String roomType;  
  final int adultCount;
  final int childCount;

  const RoomEntity({
    required this.roomType,
    required this.adultCount,
    required this.childCount,
  });

  const RoomEntity.empty()
      : roomType = '',
        adultCount = 0,
        childCount = 0;
      
  @override
  List<Object?> get props => [roomType, adultCount, childCount];
}

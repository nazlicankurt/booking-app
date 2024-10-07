import 'package:equatable/equatable.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/room_entity.dart';

class BestOffer extends Equatable {
  final int originalTravelPrice;
  final int simplePricePerPerson;
  final int includedTravelDiscount;
  final bool flightIncluded;
  final List<String> availableSpecialGroups;
  final RoomEntity room;
  final DateTime departureDate;
  final DateTime returnDate;
  final int days; 
  final int nights;  

  const BestOffer({
    required this.originalTravelPrice,
    required this.simplePricePerPerson,
    required this.includedTravelDiscount,
    required this.flightIncluded,
    required this.availableSpecialGroups,
    required this.room,
    required this.departureDate,
    required this.returnDate,
    required this.days,  
    required this.nights,
  });

  BestOffer.empty()
      : originalTravelPrice = 0,
        simplePricePerPerson = 0,
        includedTravelDiscount = 0,
        flightIncluded = false,
        availableSpecialGroups = const [],
        room = const RoomEntity.empty(),
        departureDate = DateTime(1996),
        returnDate = DateTime(1996),
        days = 0,  
        nights = 0;

  @override
  List<Object?> get props => [
        originalTravelPrice,
        simplePricePerPerson,
        includedTravelDiscount,
        flightIncluded,
        availableSpecialGroups,
        room,
        departureDate,
        returnDate,
        days,
        nights,
      ];
}

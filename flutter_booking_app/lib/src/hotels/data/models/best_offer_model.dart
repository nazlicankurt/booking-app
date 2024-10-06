import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/best_offer_entity.dart';
import 'package:flutter_booking_app/src/hotels/data/models/room_model.dart';

part 'best_offer_model.g.dart';

@JsonSerializable()
class BestOfferModel extends BestOffer {
  @override
  final RoomModel room;  

  BestOfferModel({
    required int? originalTravelPrice,
    required int? simplePricePerPerson,
    required int? includedTravelDiscount,
    required bool? flightIncluded,
    required List<String>? availableSpecialGroups,
    required this.room, 
    required super.departureDate,
    required super.returnDate,
  }) : super(
          originalTravelPrice: originalTravelPrice ?? 0,
          simplePricePerPerson: simplePricePerPerson ?? 0,
          includedTravelDiscount: includedTravelDiscount ?? 0,
          flightIncluded: flightIncluded ?? false,
          availableSpecialGroups: availableSpecialGroups ?? [],
          room: room,
        );

factory BestOfferModel.fromJson(Map<String, dynamic> json) {
  return BestOfferModel(
    originalTravelPrice: json['originalTravelPrice'] as int? ?? 0,
    simplePricePerPerson: json['simplePricePerPerson'] as int? ?? 0,
    includedTravelDiscount: json['includedTravelDiscount'] as int? ?? 0,
    flightIncluded: json['flightIncluded'] as bool? ?? false,
    availableSpecialGroups: (json['availableSpecialGroups'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList() ??
        [],
    room: json['room'] != null
        ? RoomModel.fromJson(json['room'] as Map<String, dynamic>)
        : const RoomModel(
            roomType: '',
            adultCount: 0,
            childCount: 0,
          ),
    departureDate: DateTime.tryParse(json['departureDate'] as String? ?? '') ?? DateTime.now(),
    returnDate: DateTime.tryParse(json['returnDate'] as String? ?? '') ?? DateTime.now(),
  );
}

  Map<String, dynamic> toJson() => _$BestOfferModelToJson(this);
  factory BestOfferModel.empty() {
  return BestOfferModel(
    originalTravelPrice: 0,
    simplePricePerPerson: 0,
    includedTravelDiscount: 0,
    flightIncluded: false,
    availableSpecialGroups: [],
    room: RoomModel.empty(),
    departureDate: DateTime.now(),
    returnDate: DateTime.now(),
  );

  }}

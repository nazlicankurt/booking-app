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
    required int? days,   
    required int? nights, 
  }) : super(
          originalTravelPrice: originalTravelPrice ?? 0,
          simplePricePerPerson: simplePricePerPerson ?? 0,
          includedTravelDiscount: includedTravelDiscount ?? 0,
          flightIncluded: flightIncluded ?? false,
          availableSpecialGroups: availableSpecialGroups ?? [],
          room: room,
          days: days ?? 0,
          nights: nights ?? 0,
        );

  factory BestOfferModel.fromJson(Map<String, dynamic> json) {
    return BestOfferModel(
      originalTravelPrice: json['original-travel-price'] as int? ?? 0,
      simplePricePerPerson: json['simple-price-per-person'] as int? ?? 0,
      includedTravelDiscount: json['included-travel-discount'] as int? ?? 0,
      flightIncluded: json['flight-included'] as bool? ?? false,
      availableSpecialGroups: (json['available-special-groups'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      room: RoomModel.fromJson(json['rooms']['overall'] as Map<String, dynamic>),
      departureDate: DateTime.tryParse(json['travel-date']?['departure-date'] as String? ?? '') ??
          DateTime.now(),
      returnDate: DateTime.tryParse(json['travel-date']?['return-date'] as String? ?? '') ??
          DateTime.now(),
      days: json['travel-date']?['days'] as int? ?? 0,
      nights: json['travel-date']?['nights'] as int? ?? 0,
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
      days: 0,
      nights: 0,
    );
  }
}

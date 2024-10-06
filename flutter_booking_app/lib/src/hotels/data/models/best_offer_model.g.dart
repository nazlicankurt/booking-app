// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'best_offer_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BestOfferModel _$BestOfferModelFromJson(Map<String, dynamic> json) =>
    BestOfferModel(
      originalTravelPrice: (json['originalTravelPrice'] as num?)?.toInt(),
      simplePricePerPerson: (json['simplePricePerPerson'] as num?)?.toInt(),
      includedTravelDiscount: (json['includedTravelDiscount'] as num?)?.toInt(),
      flightIncluded: json['flightIncluded'] as bool?,
      availableSpecialGroups: (json['availableSpecialGroups'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      room: RoomModel.fromJson(json['room'] as Map<String, dynamic>),
      departureDate: DateTime.parse(json['departureDate'] as String),
      returnDate: DateTime.parse(json['returnDate'] as String),
    );

Map<String, dynamic> _$BestOfferModelToJson(BestOfferModel instance) =>
    <String, dynamic>{
      'originalTravelPrice': instance.originalTravelPrice,
      'simplePricePerPerson': instance.simplePricePerPerson,
      'includedTravelDiscount': instance.includedTravelDiscount,
      'flightIncluded': instance.flightIncluded,
      'availableSpecialGroups': instance.availableSpecialGroups,
      'departureDate': instance.departureDate.toIso8601String(),
      'returnDate': instance.returnDate.toIso8601String(),
      'room': instance.room,
    };

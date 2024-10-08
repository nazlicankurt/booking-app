// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelModel _$HotelModelFromJson(Map<String, dynamic> json) => HotelModel(
      category: (json['category'] as num?)?.toInt(),
      categoryType: json['categoryType'] as String?,
      destination: json['destination'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      name: json['name'] as String?,
      bestOffer:
          BestOfferModel.fromJson(json['best-offer'] as Map<String, dynamic>),
      images: (json['images'] as List<dynamic>)
          .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratingInfo:
          RatingInfoModel.fromJson(json['rating-info'] as Map<String, dynamic>),
      analytics: HotelAnalyticsModel.fromJson(
          json['analytics'] as Map<String, dynamic>),
      hotelId: json['hotel-id'] as String,
    );

Map<String, dynamic> _$HotelModelToJson(HotelModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'categoryType': instance.categoryType,
      'destination': instance.destination,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'name': instance.name,
      'hotel-id': instance.hotelId,
      'best-offer': instance.bestOffer,
      'rating-info': instance.ratingInfo,
      'analytics': instance.analytics,
      'images': instance.images,
    };

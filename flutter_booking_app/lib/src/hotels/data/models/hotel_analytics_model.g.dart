// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_analytics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelAnalyticsModel _$HotelAnalyticsModelFromJson(Map<String, dynamic> json) =>
    HotelAnalyticsModel(
      currency: json['currency'] as String?,
      itemCategory: json['itemCategory'] as String?,
      itemCategory2: json['itemCategory2'] as String?,
      itemId: json['itemId'] as String?,
      itemName: json['itemName'] as String?,
      itemRooms: (json['itemRooms'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$HotelAnalyticsModelToJson(
        HotelAnalyticsModel instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'itemCategory': instance.itemCategory,
      'itemCategory2': instance.itemCategory2,
      'itemId': instance.itemId,
      'itemName': instance.itemName,
      'itemRooms': instance.itemRooms,
      'price': instance.price,
    };

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_analytics.dart';

part 'hotel_analytics_model.g.dart';

@JsonSerializable()
class HotelAnalyticsModel extends HotelAnalyticsEntity {
  const HotelAnalyticsModel({
    required String? currency,
    required String? itemCategory,
    required String? itemCategory2,
    required String? itemId,
    required String? itemName,
    required int? itemRooms,
    required double? price,
  }) : super(
          currency: currency ?? '',
          itemCategory: itemCategory ?? '',
          itemCategory2: itemCategory2 ?? '',
          itemId: itemId ?? '',
          itemName: itemName ?? '',
          itemRooms: itemRooms ?? 0,
          price: price ?? 0.0,
        );

  factory HotelAnalyticsModel.fromJson(Map<String, dynamic> json) =>
      _$HotelAnalyticsModelFromJson(json);

  Map<String, dynamic> toJson() => _$HotelAnalyticsModelToJson(this);

  factory HotelAnalyticsModel.empty() {
    return HotelAnalyticsModel(
      currency: '',
      itemCategory: '',
      itemCategory2: '',
      itemId: '',
      itemName: '',
      itemRooms: 0,
      price: 0.0,
    );
  }
}

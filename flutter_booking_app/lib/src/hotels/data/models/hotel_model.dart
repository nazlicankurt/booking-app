
import 'package:flutter_booking_app/src/hotels/data/models/hotel_analytics_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_booking_app/src/hotels/data/models/best_offer_model.dart';
import 'package:flutter_booking_app/src/hotels/data/models/image_model.dart';
import 'package:flutter_booking_app/src/hotels/data/models/rating_info_model.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_entity.dart';

part 'hotel_model.g.dart';

@JsonSerializable()
class HotelModel extends HotelEntity {
  const HotelModel({
    required int? category,
    required String? categoryType,
    required String? destination,
    required double? latitude,
    required double? longitude,
    required String? name,
    required this.bestOffer,
    required this.images,
    required this.ratingInfo,
    required this.analytics,
    required this.hotelId,
  }) : super(
          category: category ?? 0,
          categoryType: categoryType ?? '',
          destination: destination ?? '',
          hotelId: hotelId ?? '',
          latitude: latitude ?? 0.0,
          longitude: longitude ?? 0.0,
          name: name ?? '',
          bestOffer: bestOffer,
          images: images,
          ratingInfo: ratingInfo,
          analytics: analytics,
        );

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return _$HotelModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$HotelModelToJson(this);

  @override
  @JsonKey(name: 'hotel-id')
  final String hotelId;

  @override
  @JsonKey(name: 'best-offer')
  final BestOfferModel bestOffer;

  @override
  @JsonKey(name: 'rating-info')
  final RatingInfoModel ratingInfo;

  @override
  @JsonKey(name: 'analytics')
  final HotelAnalyticsModel analytics;

  @override
  @JsonKey(name: 'images')
  final List<ImageModel> images;

  // Provide an empty factory method for easy instantiation
  factory HotelModel.empty() {
    return HotelModel(
      category: 0,
      categoryType: '',
      destination: '',
      hotelId: '',
      latitude: 0.0,
      longitude: 0.0,
      name: '',
      bestOffer: BestOfferModel.empty(),
      images: [],
      ratingInfo: RatingInfoModel.empty(),
      analytics: HotelAnalyticsModel.empty(),
    );
  }
}

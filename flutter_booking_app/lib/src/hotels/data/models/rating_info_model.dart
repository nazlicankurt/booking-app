import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/rating_info_entity.dart';

part 'rating_info_model.g.dart';
@JsonSerializable()
class RatingInfoModel extends RatingInfo {
  const RatingInfoModel({
    required double? recommendationRate,
    required int? reviewsCount,
    required double? score,
    required String? scoreDescription,
  }) : super(
          recommendationRate: recommendationRate ?? 0.0,  
          reviewsCount: reviewsCount ?? 0,  
          score: score ?? 0.0, 
          scoreDescription: scoreDescription ?? '', 
        );

  factory RatingInfoModel.fromJson(Map<String, dynamic> json) =>
      _$RatingInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$RatingInfoModelToJson(this);

  factory RatingInfoModel.empty() {
    return RatingInfoModel(
      recommendationRate: 0.0,
      reviewsCount: 0,
      score: 0.0,
      scoreDescription: '',
    );
  }
}

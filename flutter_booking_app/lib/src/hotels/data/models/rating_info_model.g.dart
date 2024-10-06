// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingInfoModel _$RatingInfoModelFromJson(Map<String, dynamic> json) =>
    RatingInfoModel(
      recommendationRate: (json['recommendationRate'] as num?)?.toDouble(),
      reviewsCount: (json['reviewsCount'] as num?)?.toInt(),
      score: (json['score'] as num?)?.toDouble(),
      scoreDescription: json['scoreDescription'] as String?,
    );

Map<String, dynamic> _$RatingInfoModelToJson(RatingInfoModel instance) =>
    <String, dynamic>{
      'recommendationRate': instance.recommendationRate,
      'reviewsCount': instance.reviewsCount,
      'score': instance.score,
      'scoreDescription': instance.scoreDescription,
    };

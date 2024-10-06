import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/image_entity.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel extends ImageEntity {
  const ImageModel({
    required super.large,
    required super.small,
  });

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}

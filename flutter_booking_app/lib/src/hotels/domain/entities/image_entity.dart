import 'package:equatable/equatable.dart';

class ImageEntity extends Equatable {
  final String large;
  final String small;

  const ImageEntity({
    required this.large,
    required this.small,
  });

  @override
  List<Object?> get props => [large, small];
}

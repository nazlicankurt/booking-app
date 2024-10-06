import 'package:equatable/equatable.dart';

class RatingInfo extends Equatable {
  final double recommendationRate;
  final int reviewsCount;
  final double score;
  final String scoreDescription;

  const RatingInfo({
    required this.recommendationRate,
    required this.reviewsCount,
    required this.score,
    required this.scoreDescription,
  });

  const RatingInfo.empty()
      : recommendationRate = 0.0,
        reviewsCount = 0,
        score = 0.0,
        scoreDescription = '';

  @override
  List<Object?> get props => [
        recommendationRate,
        reviewsCount,
        score,
        scoreDescription,
      ];
}

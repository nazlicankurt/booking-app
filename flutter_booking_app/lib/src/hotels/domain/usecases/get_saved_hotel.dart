import 'package:flutter_booking_app/core/usecase/usecases.dart';
import 'package:flutter_booking_app/core/utils/typedef.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/repositories/hotel_repository.dart';

class GetFavoriteHotelsUseCase extends UsecaseWithoutParams<List<HotelEntity>> {
  final HotelRepository repository;

  const GetFavoriteHotelsUseCase(this.repository);

  @override
  ResultFuture<List<HotelEntity>> call() async {
    return repository.getFavoriteHotels();
  }
}

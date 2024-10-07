import 'package:flutter_booking_app/core/usecase/usecases.dart';
import 'package:flutter_booking_app/core/utils/typedef.dart';
import 'package:flutter_booking_app/src/hotels/domain/entities/hotel_entity.dart';
import 'package:flutter_booking_app/src/hotels/domain/repositories/hotel_repository.dart';

class SaveFavoriteHotelUseCase extends UsecaseWithParams<void, HotelEntity> {
  final HotelRepository repository;

  const SaveFavoriteHotelUseCase(this.repository);

  @override
  ResultFuture<void> call(HotelEntity hotel) async {
    return repository.saveFavoriteHotel(hotel);
  }
}

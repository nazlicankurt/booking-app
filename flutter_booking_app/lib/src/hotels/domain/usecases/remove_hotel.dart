import 'package:flutter_booking_app/core/usecase/usecases.dart';
import 'package:flutter_booking_app/core/utils/typedef.dart';
import 'package:flutter_booking_app/src/hotels/domain/repositories/hotel_repository.dart';

class RemoveFavoriteHotelUseCase extends UsecaseWithParams<void, String> {
  final HotelRepository repository;

  const RemoveFavoriteHotelUseCase(this.repository);

  @override
  ResultFuture<void> call(String hotelId) async {
    return repository.removeFavoriteHotel(hotelId);
  }
}

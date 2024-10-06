//What does the class depend on?
//Answer -- The class depends on the following: HotelRepostory
// How can we create a fake version of the dependency?
//Answer -- User Mocktail to create a fake version of the dependency
// How do we control what our dependencies do?
//Answer -- Using the mocktail's apis, we can control what our dependencies do

import 'package:flutter_booking_app/src/hotels/domain/repositories/hotel_repository.dart';

import 'package:mocktail/mocktail.dart';

class MockHotelRepo extends Mock implements HotelRepository {

}
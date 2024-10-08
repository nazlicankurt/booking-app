import 'package:flutter_booking_app/src/hotels/domain/usecases/get_saved_hotel.dart';
import 'package:flutter_booking_app/src/hotels/domain/usecases/remove_hotel.dart';
import 'package:flutter_booking_app/src/hotels/domain/usecases/save_hotel.dart';
import 'package:flutter_booking_app/src/hotels/presentation/bloc/hotel_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart'; 

import 'package:flutter_booking_app/src/hotels/domain/usecases/get_hotel.dart';
import 'package:flutter_booking_app/src/hotels/data/datasources/hotel_remote_data_source.dart';
import 'package:flutter_booking_app/src/hotels/data/datasources/hotel_local_data_source.dart';
import 'package:flutter_booking_app/src/hotels/data/repositories/hotel_repository_impl.dart';
import 'package:flutter_booking_app/src/hotels/domain/repositories/hotel_repository.dart';

import 'package:flutter_booking_app/src/favorites/presentation/bloc/favorites_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton(() => http.Client());

  // Register SharedPreferences
  final prefs = await SharedPreferences.getInstance(); 
  sl.registerLazySingleton(() => prefs); 

  // Data sources
  sl.registerLazySingleton<HotelRemoteDataSource>(
      () => HotelRemoteDataSourceImpl(sl<http.Client>()));

  sl.registerLazySingleton<HotelLocalDataSource>(
      () => HotelLocalDataSourceImpl(sl<SharedPreferences>()));

  // Repositories
  sl.registerLazySingleton<HotelRepository>(
      () => HotelRepositoryImpl(
          sl<HotelRemoteDataSource>(),
         sl<HotelLocalDataSource>(),  
        ));

  // Use cases
  sl.registerLazySingleton(() => GetHotelsUseCase(sl<HotelRepository>()));
  sl.registerLazySingleton(() => GetFavoriteHotelsUseCase(sl<HotelRepository>()));
  sl.registerLazySingleton(() => SaveFavoriteHotelUseCase(sl<HotelRepository>()));
  sl.registerLazySingleton(() => RemoveFavoriteHotelUseCase(sl<HotelRepository>()));

  // Blocs (registered using registerFactory for short-lived instances)
  sl.registerFactory(() => HotelBloc(getHotels: sl<GetHotelsUseCase>()));
  sl.registerFactory(() => FavoritesBloc(
      getFavoriteHotelsUseCase: sl<GetFavoriteHotelsUseCase>(),
      saveFavoriteHotelUseCase: sl<SaveFavoriteHotelUseCase>(),
      removeFavoriteHotelUseCase: sl<RemoveFavoriteHotelUseCase>(), 
  ));
}

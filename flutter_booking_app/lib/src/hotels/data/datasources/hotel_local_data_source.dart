import 'package:shared_preferences/shared_preferences.dart';

abstract class HotelLocalDataSource {
  Future<void> saveFavoriteHotel(String hotelId);
  Future<void> removeFavoriteHotel(String hotelId);
  Future<List<String>> getFavoriteHotels();
}

class HotelLocalDataSourceImpl implements HotelLocalDataSource {
  final SharedPreferences sharedPreferences;

  const HotelLocalDataSourceImpl(this.sharedPreferences);

  static const String favoritesKey = 'FAVORITE_HOTELS';

  @override
  Future<void> saveFavoriteHotel(String hotelId) async {
    final favoriteHotels = sharedPreferences.getStringList(favoritesKey) ?? [];
    favoriteHotels.add(hotelId);
    await sharedPreferences.setStringList(favoritesKey, favoriteHotels);
  }

  @override
  Future<void> removeFavoriteHotel(String hotelId) async {
    final favoriteHotels = sharedPreferences.getStringList(favoritesKey) ?? [];
    favoriteHotels.remove(hotelId);
    await sharedPreferences.setStringList(favoritesKey, favoriteHotels);
  }

  @override
  Future<List<String>> getFavoriteHotels() async {
    return sharedPreferences.getStringList(favoritesKey) ?? [];
  }
}

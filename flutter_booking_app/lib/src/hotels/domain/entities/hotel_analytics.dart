import 'package:equatable/equatable.dart';

class HotelAnalyticsEntity extends Equatable {
  final String currency;
  final String itemCategory;
  final String itemCategory2;
  final String itemId;
  final String itemName;
  final int itemRooms;
  final double price;

  const HotelAnalyticsEntity({
    required this.currency,
    required this.itemCategory,
    required this.itemCategory2,
    required this.itemId,
    required this.itemName,
    required this.itemRooms,
    required this.price,
  });

  const HotelAnalyticsEntity.empty()
      : currency = '',
        itemCategory = '',
        itemCategory2 = '',
        itemId = '',
        itemName = '',
        itemRooms = 0,
        price = 0.0;

  @override
  List<Object?> get props => [
        currency,
        itemCategory,
        itemCategory2,
        itemId,
        itemName,
        itemRooms,
        price,
      ];
}

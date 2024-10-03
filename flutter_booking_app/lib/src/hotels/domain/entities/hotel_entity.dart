import 'package:flutter/material.dart';

class HotelEntity {
  final String categoryType;         
  final String destination;
  final String hotelId;               
  final double latitude;
  final double longitude;
  final String name;
  final Category category;
  final List<Badge> badges;             
  final BestOffer bestOffer;         
  final List<ImageEntity> images;    
  final RatingInfo ratingInfo;         

  HotelEntity({
    required this.categoryType,
    required this.destination,
    required this.hotelId,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.category,
    required this.badges,
    required this.bestOffer,
    required this.images,
    required this.ratingInfo,
  });
}


class Category {
  final String currency;
  final String itemCategory;
  final String itemCategory2;
  final String itemId;
  final String itemListName;
  final String itemName;
  final int itemRooms;
  final double price;
  final int quantity;

  Category({
    required this.currency,
    required this.itemCategory,
    required this.itemCategory2,
    required this.itemId,
    required this.itemListName,
    required this.itemName,
    required this.itemRooms,
    required this.price,
    required this.quantity,
  });
}

class BestOffer {
  final int? appliedTravelDiscount;
  final int includedTravelDiscount;
  final int originalTravelPrice;
  final int simplePricePerPerson;
  final int total;
  final int travelPrice;
  final bool flightIncluded;
  final List<DetailedPricePerPerson> detailedPricePerPerson; 
  final AvailableSpecialGroups availableSpecialGroups;    

  BestOffer({
    this.appliedTravelDiscount,
    required this.includedTravelDiscount,
    required this.originalTravelPrice,
    required this.simplePricePerPerson,
    required this.total,
    required this.travelPrice,
    required this.flightIncluded,
    required this.detailedPricePerPerson,
    required this.availableSpecialGroups,
  });
}

class ImageEntity {
  final String large;
  final String small;

  ImageEntity({
    required this.large,
    required this.small,
  });
}

class RatingInfo {
  final double recommendationRate;
  final int reviewsCount;
  final double score;
  final String scoreDescription;

  RatingInfo({
    required this.recommendationRate,
    required this.reviewsCount,
    required this.score,
    required this.scoreDescription,
  });
}

class AvailableSpecialGroups {
  final String flexible;
  final int promotion;

  AvailableSpecialGroups({
    required this.flexible,
    required this.promotion,
  });
}

class DetailedPricePerPerson {
  final double pricePerPerson;

  DetailedPricePerPerson({
    required this.pricePerPerson,
  });
}

class Room {
  final String boarding;
  final String name;
  final int adultCount;
  final int childrenCount;
  final int quantity;
  final bool sameBoarding;
  final bool sameRoomGroups;
  final List<int> childrenAges;
  final List<DetailedPricePerPerson> detailedPricePerPerson;

  Room({
    required this.boarding,
    required this.name,
    required this.adultCount,
    required this.childrenCount,
    required this.quantity,
    required this.sameBoarding,
    required this.sameRoomGroups,
    required this.childrenAges,
    required this.detailedPricePerPerson,
  });
}

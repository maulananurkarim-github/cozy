// To parse this JSON data, do
//
//     final space = spaceFromJson(jsonString);

import 'dart:convert';

List<Space> spaceFromJson(String str) => List<Space>.from(json.decode(str).map((x) => Space.fromJson(x)));

class Space {
  Space({
    this.id,
    this.name,
    this.city,
    this.country,
    this.price,
    this.imageUrl,
    this.rating,
    this.address,
    this.phone,
    this.mapUrl,
    this.photos,
    this.numberOfKitchens,
    this.numberOfBedrooms,
    this.numberOfCupboards,
  });

  int? id;
  String? name;
  String? city;
  String? country;
  int? price;
  String? imageUrl;
  int? rating;
  String? address;
  String? phone;
  String? mapUrl;
  List<String>? photos;
  int? numberOfKitchens;
  int? numberOfBedrooms;
  int? numberOfCupboards;

  factory Space.fromJson(Map<String, dynamic> json) => Space(
        id: json["id"],
        name: json["name"],
        city: json["city"],
        country: json["country"],
        price: json["price"],
        imageUrl: json["image_url"],
        rating: json["rating"],
        address: json["address"],
        phone: json["phone"],
        mapUrl: json["map_url"],
        photos: List<String>.from(json["photos"].map((x) => x)),
        numberOfKitchens: json["number_of_kitchens"],
        numberOfBedrooms: json["number_of_bedrooms"],
        numberOfCupboards: json["number_of_cupboards"],
      );
}

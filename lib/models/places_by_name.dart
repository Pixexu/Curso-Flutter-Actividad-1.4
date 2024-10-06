// To parse this JSON data, do
//
//     final placesByName = placesByNameFromJson(jsonString);

import 'dart:convert';

PlacesByName placesByNameFromJson(String str) =>
    PlacesByName.fromJson(json.decode(str));

String placesByNameToJson(PlacesByName data) => json.encode(data.toJson());

class PlacesByName {
  final String countryAbbreviation;
  final List<Place> places;
  final String country;
  final String placeName;
  final String state;
  final String stateAbbreviation;

  PlacesByName({
    required this.countryAbbreviation,
    required this.places,
    required this.country,
    required this.placeName,
    required this.state,
    required this.stateAbbreviation,
  });

  factory PlacesByName.fromJson(Map<String, dynamic> json) => PlacesByName(
        countryAbbreviation: json["country abbreviation"],
        places: List<Place>.from(json["places"].map((x) => Place.fromJson(x))),
        country: json["country"],
        placeName: json["place name"],
        state: json["state"],
        stateAbbreviation: json["state abbreviation"],
      );

  Map<String, dynamic> toJson() => {
        "country abbreviation": countryAbbreviation,
        "places": List<dynamic>.from(places.map((x) => x.toJson())),
        "country": country,
        "place name": placeName,
        "state": state,
        "state abbreviation": stateAbbreviation,
      };
}

class Place {
  final String placeName;
  final String longitude;
  final String postCode;
  final String latitude;

  Place({
    required this.placeName,
    required this.longitude,
    required this.postCode,
    required this.latitude,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        placeName: json["place name"],
        longitude: json["longitude"],
        postCode: json["post code"],
        latitude: json["latitude"],
      );

  Map<String, dynamic> toJson() => {
        "place name": placeName,
        "longitude": longitude,
        "post code": postCode,
        "latitude": latitude,
      };
}

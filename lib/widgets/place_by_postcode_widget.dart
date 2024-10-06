import 'package:flutter/material.dart';

import '../models/places_by_postcode.dart';

//==================================================
class PlaceByPostcodeWidget extends StatelessWidget {
  const PlaceByPostcodeWidget({super.key, required this.place});

  final Place place;

  //==================================================
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          place.placeName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          place.state,
        ),
        Text(
          "${place.latitude}, ${place.longitude}",
        ),
      ],
    );
  }
}

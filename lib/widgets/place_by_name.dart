import 'package:flutter/material.dart';

import '../models/places_by_name.dart';

//==================================================
class PlaceByNameWidget extends StatelessWidget {
  const PlaceByNameWidget({super.key, required this.place});

  final Place place;

  //==================================================
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          place.postCode,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          place.placeName,
        ),
        Text(
          "${place.latitude}, ${place.longitude}",
        ),
      ],
    );
  }
}

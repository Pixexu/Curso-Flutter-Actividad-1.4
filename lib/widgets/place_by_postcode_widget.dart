import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/places_by_postcode.dart';
import '../services/map_service.dart';

//==================================================
class PlaceByPostcodeWidget extends StatelessWidget {
  const PlaceByPostcodeWidget({super.key, required this.place});

  final Place place;

  //==================================================
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              place.placeName,
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              place.state,
              style: TextStyle(
                fontFamily: GoogleFonts.montserrat().fontFamily,
                fontSize: 16,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.amber.shade900, // background (button) color
                foregroundColor: Colors.white, // foreground (text) color
              ),
              onPressed: () {
                MapService.openMap(
                    place.placeName,
                    double.parse(place.latitude),
                    double.parse(
                      place.longitude,
                    ));
              },
              child: const Icon(
                Icons.location_on,
                //color: Colors.amber.shade800,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}

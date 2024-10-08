import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

//==================================================
class MapService {
  //==================================================
  static Future<void> openMap(
      String label, double latitude, double longitude) async {
    //debugPrint("latitude: $latitude");
    ///debugPrint("longitude: $longitude");
    String googleUrl =
        "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude";
    //debugPrint(googleUrl);
    if (!await launchUrl(
      Uri.parse(googleUrl),
      mode: LaunchMode.externalApplication,
      webOnlyWindowName: "_blank",
    )) {
      debugPrint("Could not launch '$googleUrl'!");
      //throw Exception("Could not launch $googleUrl");
    }
  }
}

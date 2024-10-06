import 'package:http/http.dart' as http;

import '../models/places_by_name.dart';
import '../models/places_by_postcode.dart';

//==================================================
class PostcodeService {
  String urlByPostcode = "https://api.zippopotam.us/es/";
  String urlByName = "https://api.zippopotam.us/es/ct/";

  //==================================================
  Future<PlacesByPostcode?> fetchByPostcode(String postcode) async {
    //http get
    http.Response response =
        await http.get(Uri.parse(urlByPostcode + postcode));

    if (response.body != "{}") {
      //json to model
      final placesByPostcode = placesByPostcodeFromJson(response.body);
      //return model
      return placesByPostcode;
    }

    //return null
    return null;
  }

  //==================================================
  Future<PlacesByName?> fetchByName(String name) async {
    //http get
    http.Response response = await http.get(Uri.parse(urlByName + name));

    if (response.body != "{}") {
      //json to model
      final PlacesByName placesByName = placesByNameFromJson(response.body);
      //return model
      return placesByName;
    }
    //return null
    return null;
  }
}

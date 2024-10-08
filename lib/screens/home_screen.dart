import 'package:activitat_1_4/widgets/place_by_postcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/places_by_name.dart';
import '../models/places_by_postcode.dart';
import '../services/postcode_service.dart';
import '../widgets/place_by_name.dart';

//==================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  //==================================================
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

//==================================================
class _HomeScreenState extends State<HomeScreen> {
  //service
  PostcodeService postcodeService = PostcodeService();

  //model
  late PlacesByName? placesByName = null;
  late PlacesByPostcode? placesByPostcode = null;

  //controllers
  late TextEditingController _textEditingControllerPostcode;
  late TextEditingController _textEditingControllerName;

  bool searching = false;

  //==================================================
  @override
  void initState() {
    super.initState();
    _textEditingControllerPostcode = TextEditingController();
    _textEditingControllerName = TextEditingController();
  }

  //==================================================
  @override
  void dispose() {
    _textEditingControllerPostcode.dispose();
    _textEditingControllerName.dispose();
    super.dispose();
  }

  //==================================================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber.shade900,
        centerTitle: true,
        //foregroundColor: Colors.white,
        title: Text(
          "CÓDIGOS POSTALES",
          style: TextStyle(
            color: Colors.white,
            fontFamily: GoogleFonts.montserrat().fontFamily,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.amber.shade50,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //==================================================
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      //==================================================
                      Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.amber.shade900,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: TextField(
                              autofocus: true,
                              controller: _textEditingControllerPostcode,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.amber.shade900,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.amber.shade900,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                hintText: "Introduce el Código Postal",
                                hintStyle: TextStyle(
                                  color: Colors.amber.shade900,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily,
                                ),
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              keyboardType: TextInputType.number,
                              maxLines: 1,
                              minLines: 1,
                              textAlign: TextAlign.left,
                              onChanged: (value) {
                                if (value != "") searchPlaceByPostcode(value);
                              },
                              onSubmitted: (value) {
                                if (value != "") searchPlaceByPostcode(value);
                              },
                            ),
                          ),
                          const SizedBox(width: 5),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .amber.shade900, // background (button) color
                              foregroundColor:
                                  Colors.white, // foreground (text) color
                            ),
                            onPressed: onPressedByPostcode,
                            child: const Icon(
                              Icons.search,
                              //color: Colors.amber.shade800,
                            ),
                          ),
                        ],
                      ),
                      //==================================================
                      const SizedBox(height: 5),
                      //==================================================
                      Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.amber.shade900,
                          ),
                          const SizedBox(width: 5),
                          Expanded(
                            child: TextField(
                              controller: _textEditingControllerName,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.amber.shade900,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.amber.shade900,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                hintText: "Introduce el Nombre del Lugar",
                                hintStyle: TextStyle(
                                  color: Colors.amber.shade900,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily,
                                ),
                              ),
                              // inputFormatters: [
                              //   FilteringTextInputFormatter.digitsOnly
                              // ],
                              keyboardType: TextInputType.name,
                              maxLines: 1,
                              minLines: 1,
                              textAlign: TextAlign.left,
                              onChanged: (value) {
                                if (value != "") searchPlaceByName(value);
                              },
                              onSubmitted: (value) {
                                if (value != "") searchPlaceByName(value);
                              },
                            ),
                          ),
                          const SizedBox(width: 5),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .amber.shade900, // background (button) color
                              foregroundColor:
                                  Colors.white, // foreground (text) color
                            ),
                            onPressed: onPressedByName,
                            child: const Icon(
                              Icons.search,
                              //color: Colors.amber.shade800,
                            ),
                          ),
                        ],
                      ),
                      //==================================================
                    ],
                  ),
                ),
              ),
              //==================================================
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.list,
                                color: Colors.amber.shade800,
                              ),
                              Text(
                                "RESULTADOS",
                                style: TextStyle(
                                  color: Colors.amber.shade800,
                                  fontFamily:
                                      GoogleFonts.montserrat().fontFamily,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          if (searching)
                            Center(
                              child: CircularProgressIndicator(
                                color: Colors.amber.shade900,
                              ),
                            ),
                          if ((!searching) &&
                              (placesByPostcode == null) &&
                              (placesByName == null))
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "NO HAY DATOS",
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.montserrat().fontFamily,
                                    fontSize: 16,
                                  ),
                                )
                              ],
                            ),
                          if ((!searching) && (placesByPostcode != null))
                            for (var place in placesByPostcode!.places)
                              PlaceByPostcodeWidget(place: place),
                          if ((!searching) && (placesByName != null))
                            for (var place in placesByName!.places)
                              PlaceByNameWidget(place: place),
                          //==================================================
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //==================================================
  void onPressedByPostcode() {
    searchPlaceByPostcode(_textEditingControllerPostcode.text);
  }

  //==================================================
  void onPressedByName() {
    searchPlaceByName(_textEditingControllerName.text);
  }

  //==================================================
  Future<void> searchPlaceByPostcode(String value) async {
    setState(() {
      searching = true;
    });
    placesByPostcode = await postcodeService.fetchByPostcode(value);
    placesByName = null;
    searching = false;
    setState(() {});
  }

  //==================================================
  Future<void> searchPlaceByName(String value) async {
    setState(() {
      searching = true;
    });
    placesByName = await postcodeService.fetchByName(value);
    placesByPostcode = null;
    searching = false;
    setState(() {});
  }
}

import 'package:covi_nepal/models/locations.dart';
import 'package:covi_nepal/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/covid_service.dart';

CovidService covidService = CovidService();

class VaccinesLocation extends StatefulWidget {
  @override
  _VaccinesLocationState createState() => _VaccinesLocationState();
}

class _VaccinesLocationState extends State<VaccinesLocation> {
  final TextEditingController _typeAheadCityController =
      TextEditingController();

  Locations locations;

  @override
  initState() {
    super.initState();
    locations = Locationcollection()
        .locationCollectin
        .firstWhere((element) => element.city == 'Kathmandu');

    this._typeAheadCityController.text = "Kathmandu";
  }

  List<Locations> _getCitySuggestions(List<Locations> list, String query) {
    List newlsit = list
        .where((x) => x.city.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return newlsit;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 15),
              child: Text(
                "Search Vaccines Distibution By City Name \n(Kathmandu ,Pokhara etc)",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            TypeAheadFormField(
              textFieldConfiguration: TextFieldConfiguration(
                controller: this._typeAheadCityController,
                decoration: InputDecoration(
                  hintText: 'Type here city name',
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.all(20),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(left: 24.0, right: 16.0),
                    child: Icon(
                      Icons.search,
                      color: kPrimaryColor,
                      size: 28,
                    ),
                  ),
                ),
              ),
              suggestionsCallback: (pattern) {
                return _getCitySuggestions(
                    Locationcollection().locationCollectin, pattern);
              },
              itemBuilder: (context, Locations suggestion) {
                return ListTile(
                  title: Text(
                    '${suggestion.city} (${suggestion.locationName})',
                    style: TextStyle(fontSize: 14),
                  ),
                );
              },
              transitionBuilder: (context, suggestionsBox, controller) {
                return suggestionsBox;
              },
              onSuggestionSelected: (Locations suggestion) {
                _typeAheadCityController.text = suggestion.city;

                setState(() {
                  _typeAheadCityController.text = suggestion.city;
                  List _tempLocation;

                  // locations = Locationcollection().locationCollectin. firstWhere(
                  //     (element) => element.city == suggestion.locationName);
                  _tempLocation = Locationcollection()
                      .locationCollectin
                      .where((x) => x.locationName
                          .toLowerCase()
                          .contains(suggestion.locationName.toLowerCase()))
                      .toList();
                  locations = _tempLocation[0];
                });
              },
            ),
            SizedBox(
              height: 8,
            ),
            Card(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: (Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "यो फारम किन भर्ने ? \n\n १) तपाईं कुन केन्द्रमा खोप लगाउन चाहनुहुन्छ भन्ने सूचना प्राप्त गर्न \n २) यो स्वैच्छिक, व्यक्तिगत आवेदन फारम हो \n ३) यो फारम हालसम्म खोप नलगाएको १८ वर्ष र सो भन्दा माथिका व्यक्तिहरुबाट भर्न आव्हान गरिएको छ \n ४) यो आवेदन फारमबाट प्राप्त भएका विवरण पालिका स्तर मा खोप संग संबन्धित योजना तथा व्यवस्थापन गर्नका प्रयोग गरिने छ\n ५) यो फारम भर्ने बित्तिकै खोप लगाउने सुनिस्चितता भने जनाउदैन'",
                      maxLines: 10,
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              locations.cityNepali,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              locations.locationName,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.8),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Text(
                              'समय : 10 AM - 4 PM',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ])),
            ))
          ],
        ),
      ),
      Positioned(
          right: 30,
          bottom: 30,
          child: ElevatedButton.icon(
            onPressed: launcshare,
            icon: Icon(Icons.calendar_today),
            label: Text('Register Form (फारम) '),
          ))
    ]);
  }
}

launcshare() async {
  const url = 'https://vaccine.mohp.gov.np';
  if (await canLaunch(url)) {
    await launch(
      url,
      enableJavaScript: true,
      enableDomStorage: true,
      forceWebView: true,
    );
  } else {
    throw 'Could not launch $url';
  }
}

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:flutter_google_maps_webservices/geolocation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter_web/google_maps_flutter_web.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late GoogleMapController mapController;
  // final geolocation =
  // GoogleMapsGeolocation(apiKey: Platform.environment['AIzaSyCQAOocqaXe95PO3jOJG-ibR9Sk7CeM7cM']);

  // Future<void> getLocation()async{
  //   var sessionToken = 'xyzabc_1234';
  //   var res = await places.autocomplete('Amoeba', sessionToken: sessionToken);
  //   if (res.isOkay) {
  //     // list autocomplete prediction
  //     for (var p in res.predictions) {
  //       print('- ${p.description}');
  //     }
  //
  //     final placeId = res.predictions.first.placeId;
  //     if (placeId == null) return;
  //
  //     // get detail of the first result
  //     var details = await places.getDetailsByPlaceId(
  //       placeId,
  //       sessionToken: sessionToken,
  //     );
  //
  //     print('\nDetails :');
  //     print(details.result.formattedAddress);
  //     print(details.result.formattedPhoneNumber);
  //     print(details.result.url);
  //   } else {
  //     print(res.errorMessage);
  //   }
  //
  //   places.dispose();
  //   // var res = await geolocation.getGeolocation();
  //   // if (res.isOkay) {
  //   //   print('Latitude: ${res.location?.lat}');
  //   //   print('Longitude: ${res.location?.lng}');
  //   //   print('Accuracy: ${res.accuracy}');
  //   // } else {
  //   //   print(res.error?.message);
  //   // }
  //   //
  //   // geolocation.dispose();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getLocation();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("HOME"),
      // ),
      body: Container(
        color: Colors.amber,
      ),
    );
  }
}

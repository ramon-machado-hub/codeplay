import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Maps extends StatefulWidget {
  const Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late GoogleMapController mapscontroller;
  List<Marker> _markers = [];
  bool showMaps = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _markers.add(const Marker(
        markerId: MarkerId("mylocation"),
        position: LatLng( -10.9145, -37.6639),
    ));
    if (_markers.isNotEmpty){
      setState(() {
        showMaps = true;
      });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20),
      child: showMaps ?
        Container(
          height: 300,
          width: 1230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12)
          ),
          child: GoogleMap(
            onMapCreated: (controller){
              setState(() {
                mapscontroller = controller;
              });
            },
            markers: Set<Marker>.of(_markers),
            mapType: MapType.terrain,
            initialCameraPosition: CameraPosition(
              target: LatLng(-10.9145, -37.6639),
              zoom: 13,
            ),
          ),
        )
          :
        CircularProgressIndicator(
            color: Colors.amberAccent,
        ),
    );
  }
}

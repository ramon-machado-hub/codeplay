import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController? mapController;
  LatLng _initialCameraPosition = LatLng(0, 0);
  LocationData? _currentLocation;
  bool _hasPermission = false;

  final Location location = Location();
  PermissionStatus? _permissionStatus;

  Future<void> requestLocationPermission() async {
    final geolocation = html.window.navigator.geolocation;
    if (geolocation != null) {
      final position = await geolocation.getCurrentPosition();
      setState(() {
        _hasPermission = true;
      });
    }
  }

  Future<void> checkLocationPermission() async {
    final geolocation = html.window.navigator.geolocation;
    if (geolocation != null) {
      final position = await geolocation.getCurrentPosition();
      setState(() {
        _hasPermission = true;
      });
    }
  }

  Widget buildMap() {
    if (_hasPermission) {
      return Container(
        color: Colors.cyan,
        height: MediaQuery.of(context).size.height * 0.5,
        width: (MediaQuery.of(context).size.width / 2) * 0.9,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _initialCameraPosition,
            zoom: 15,
          ),
          onMapCreated: (GoogleMapController controller) {
            mapController = controller;
          },
          myLocationEnabled: true,
        ),
      );
    } else {
      return Container();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkLocationPermission();

  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("CADASTRAR ENDEREÇOS"),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.amber,
        child: Row(
          children: [
            SizedBox(
              width: size.width/2,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //cabeçalho
                  SizedBox(
                    height: size.height*0.1,
                    width: (size.width/2)*0.9,
                    child: Text(
                      'Status da Permissão: ${_permissionStatus.toString()}',
                      style: TextStyle(fontSize: 18),
                    ),

                  ),
                  ElevatedButton(
                    onPressed: requestLocationPermission,
                    child: Text('Solicitar Permissão de Localização'),
                  ),
                  //mapa
                  buildMap(),
                  // Container(
                  //   color: Colors.cyan,
                  //   height: size.height*0.5,
                  //   width: (size.width/2)*0.9,
                  //   child: GoogleMap(
                  //     initialCameraPosition: CameraPosition(
                  //       target: _initialCameraPosition,
                  //       zoom: 15,
                  //     ),
                  //     onMapCreated: (GoogleMapController controller) {
                  //       mapController = controller;
                  //     },
                  //     myLocationEnabled: true,
                  //   ),
                  // )
                ],
              ),
            ),
            SizedBox(
              width: size.width/2,
              height: size.height,
            )

          ],
        ),

      ),
    );
  }
}

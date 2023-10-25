import 'dart:html';

import 'package:codeplay/provider/enderecos_provider.dart';
import 'package:codeplay/widgets/button_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:codeplay/themes/app_colors.dart';
import 'package:codeplay/themes/app_text_styles.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/endereco_model.dart';
import 'package:location/location.dart';
import 'dart:html' as html;

class Enderecos extends StatefulWidget {
  const Enderecos({Key? key}) : super(key: key);

  @override
  State<Enderecos> createState() => _EnderecosState();
}

class _EnderecosState extends State<Enderecos> {
  late GoogleMapController mapscontroller;
  List<Marker> _markers = [];
  bool showMaps = true;
  bool _checkLocalizacaoAtual = false;
  List<EnderecoModel> list = [];

  GoogleMapController? mapController;
  double? latitude;
  double? longitude;
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
        latitude = position.coords!.latitude?.toDouble();
        longitude = position.coords!.longitude?.toDouble();


        _initialCameraPosition = (latitude, longitude) as LatLng;
      });
    }
  }


  Future<void> checkLocationPermission() async {
    final geolocation = html.window.navigator.geolocation;
    if (geolocation != null) {
      final position = await geolocation.getCurrentPosition();
      setState(() {
        _hasPermission = true;
        latitude = position.coords!.latitude?.toDouble();
        longitude = position.coords!.longitude?.toDouble();


        _initialCameraPosition = LatLng(latitude!, longitude!);
      });
    }
  }
  
  Widget buildMap() {
    if (_hasPermission) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: (MediaQuery.of(context).size.width / 2) * 0.9,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12))),
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
    // checkLocationPermission();
    list = Provider.of<EnderecoProvider>(context, listen:false).list;
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
  
  bool _checkOption = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("ENDEREÇOS", style: AppTextStyles.titleAppbar,),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            
            SizedBox(
              width: (size.width/2)*0.8,
              height: size.height,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    SizedBox(
                      width: (size.width/2)*0.8,
                      height: size.height*0.15,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("USAR LOCALIZAÇÂO ATUAL?", style: AppTextStyles.labelPoorplek18,),
                          Checkbox(
                              value: _checkLocalizacaoAtual,
                              onChanged: (value){
                                // _checkLocalizacaoAtual = !_checkLocalizacaoAtual;
                                setState(() {
                                  checkLocationPermission();
                                });
                              }),

                        ],
                      ),
                    ),
                    SizedBox(
                      width: (size.width/2)*0.8,
                      height: size.height*0.65,
                      child: buildMap()
                      // GoogleMap(
                      //   onMapCreated: (controller){
                      //     setState(() {
                      //       mapscontroller = controller;
                      //     });
                      //   },
                      //   markers: Set<Marker>.of(_markers),
                      //   mapType: MapType.terrain,
                      //   initialCameraPosition: const CameraPosition(
                      //     target: LatLng(-10.9145, -37.6639),
                      //     zoom: 16,
                      //   ),
                      // ),
                    )
                  ],
                ),
              )
            ),
            SizedBox(
              width: size.width/2,
              height: size.height,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("QUAL O ENVIO PREFERE?", style: AppTextStyles.labelPoorplek18,),
                    Container(
                      // color: Colors.red,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      width: size.width/2,
                      height: size.height*0.6,
                        child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (buildContext, index){
                          return Card(
                            child: ListTile(
                              title: Text(list[index].endereco),
                              subtitle: Text(list[index].numero),
                            ),
                          );
                        })
                        // Text("LISTVIEW ENDEREÇOS"),
                    ),
                    ButtonWidget(
                        onTap: (){
                          Navigator.pushNamed(context, "/cadastrar_endereco");
                        }, label: "CADASTRAR NOVO", width: size.width*0.2, height: size.height*0.1)
                  ],
                ),
              ),
            )

          ],
        ),

      ),
    );
  }
}

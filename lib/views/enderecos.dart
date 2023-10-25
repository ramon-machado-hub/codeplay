import 'package:codeplay/widgets/button_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:codeplay/themes/app_colors.dart';
import 'package:codeplay/themes/app_text_styles.dart';
import 'package:codeplay/widgets/input_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf/shelf.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_maps_webservice/places.dart';
// import 'package:google_maps_webservice/geocoding.dart';

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
                                _checkLocalizacaoAtual = !_checkLocalizacaoAtual;
                                setState(() {

                                });
                              }),

                        ],
                      ),
                    ),
                    SizedBox(
                      width: (size.width/2)*0.8,
                      height: size.height*0.65,
                      child: GoogleMap(
                        onMapCreated: (controller){
                          setState(() {
                            mapscontroller = controller;
                          });
                        },
                        markers: Set<Marker>.of(_markers),
                        mapType: MapType.terrain,
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(-10.9145, -37.6639),
                          zoom: 16,
                        ),
                      ),
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
                      color: Colors.red,
                      width: size.width/2,
                      height: size.height*0.6,
                        child: Text("LISTVIEW ENDEREÇOS"),
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

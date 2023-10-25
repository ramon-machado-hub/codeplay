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

class CadastroEndereco extends StatefulWidget {
  const CadastroEndereco({Key? key}) : super(key: key);

  @override
  State<CadastroEndereco> createState() => _CadastroEnderecoState();
}

class _CadastroEnderecoState extends State<CadastroEndereco> {
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
  
  bool _checkOption = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.white, // Defina a cor do ícone de volta desejada
        ),
        backgroundColor: AppColors.primaryColor,
        title: Text("CADASTRAR ENDEREÇO", style: AppTextStyles.titleAppbar,),
        centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Row(
          children: [
            
            SizedBox(
              width: size.width/2,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //informação
                  Card(
                    child: Container(
                      width: (size.width/2)*0.8,
                      height: size.height*0.1,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //icone
                                Icon(Icons.location_on, size: size.height*0.05),
                                //texto
                                Text("USAR LOCALIZAÇÃO ATUAL", style: AppTextStyles.labelBoldBlack18,),
                              ],
                            ),
                            //botão
                            Checkbox(
                                value: _checkOption,
                                onChanged: (value){
                                  _checkOption = !_checkOption;
                                  setState(() {

                                  });
                                })
                          ],
                        ),
                      )
                    )
                  ),
                  Container(
                      width: (size.width/2)*0.7,
                      height: size.height*0.5,
                      child:  GoogleMap(
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
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width/2,
              height: size.height,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        SizedBox(
                          width: (size.width/2)*0.7-20,
                          child:  InputTextWidget(
                              onChanged: (value)async {
                                if (value.isNotEmpty){
                                  List<String> list = [];

                                  print(list.length);
                                  setState(() {
                                    
                                  });
                                }
                              },
                              heigth: size.height*0.15,
                              label: "Endereço *",
                              keyboardType: TextInputType.text,
                              backgroundColor: AppColors.white,
                              borderColor: AppColors.black,
                              textStyle: AppTextStyles.labelBlack18,
                              initalValue: ""),
                        ),
                        SizedBox(
                          width: (size.width/2)*0.3-40,
                          child: InputTextWidget(
                              heigth: size.height*0.15,
                              label: "Número *",
                              keyboardType: TextInputType.number,
                              backgroundColor: AppColors.white,
                              borderColor: AppColors.black,
                              textStyle: AppTextStyles.labelBlack18,
                              initalValue: ""),


                        ),
                      ],
                    ),

                    InputTextWidget(
                        heigth: size.height*0.15,
                        label: "Bairro *",
                        keyboardType: TextInputType.text,
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.black,
                        textStyle: AppTextStyles.labelBlack18,
                        initalValue: ""),
                    InputTextWidget(
                        heigth: size.height*0.15,
                        label: "Município *",
                        keyboardType: TextInputType.text,
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.black,
                        textStyle: AppTextStyles.labelBlack18,
                        initalValue: ""),
                    InputTextWidget(
                        heigth: size.height*0.15,
                        label: "UF (Estado)",
                        keyboardType: TextInputType.text,
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.black,
                        textStyle: AppTextStyles.labelBlack18,
                        initalValue: ""),
                    InputTextWidget(
                        heigth: size.height*0.15,
                        label: "Complemento *",
                        keyboardType: TextInputType.text,
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.black,
                        textStyle: AppTextStyles.labelBlack18,
                        initalValue: ""),
                    InputTextWidget(
                        heigth: size.height*0.15,
                        label: "Referência",
                        keyboardType: TextInputType.text,
                        backgroundColor: AppColors.white,
                        borderColor: AppColors.black,
                        textStyle: AppTextStyles.labelBlack18,
                        initalValue: ""),
                    ButtonWidget(
                        onTap: (){}, label: "SALVAR", width: size.width*0.2, height: size.height*0.1)
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

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

class FinalizarPedido extends StatefulWidget {
  const FinalizarPedido({Key? key}) : super(key: key);

  @override
  State<FinalizarPedido> createState() => _FinalizarPedidoState();
}

class _FinalizarPedidoState extends State<FinalizarPedido> {
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
        title: Text("FINALIZAR PEDIDO", style: AppTextStyles.titleAppbar,),
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
                  //Entrega / Retirada
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      InkWell(
                        onTap: (){},
                        child: Text("ENTREGA", style: AppTextStyles.labelPoorplek18,),
                      ),
                      SizedBox(width: size.width*0.01,),
                      InkWell(
                        onTap: (){},
                        child: Text("RETIRADA",style: AppTextStyles.labelBlack18,),
                      )
                    ],
                  ),
                  //informação
                  Card(
                      child: Container(
                          width: (size.width/2)*0.7,
                          height: size.height*0.16,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //icone
                                SizedBox(
                                  width: (size.width/2)*0.1,
                                  height: size.height*0.15,
                                  child: Icon(Icons.location_on, size: size.height*0.05),
                                ),
                                //informações
                                SizedBox(
                                  width: (size.width/2)*0.45,
                                  height: size.height*0.15,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      //texto
                                      Text("ENDEREÇO", style: AppTextStyles.labelBoldBlack18,),
                                      Text("BAIRRO", style: AppTextStyles.labelBlack12,),
                                      Text("COMPLEMENTO", style: AppTextStyles.labelBlack12,),
                                      Text("CEP - CIDADE", style: AppTextStyles.labelBlack12,),
                                    ],
                                  ),

                                ),


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
                    Text("X itens no carrinho", style: AppTextStyles.labelBoldBlack18,),
                   //itens
                   Container(
                     width: size.width/2*0.8,
                     height: size.height*0.5,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0),
                       border: Border.all(
                         color: Colors.black, // Cor da borda (preto neste caso)
                         width: 2.0, // Largura da borda
                       ),
                     ),
                     child: ListView.builder(
                         itemCount: 4,
                         itemBuilder: (BuildContext, index){
                            return Card(
                              child: Container(
                                width: size.width/2*0.7,
                                height: size.height*0.06,
                                child: Row(
                                  children: [
                                    //imagem
                                    SizedBox(
                                      height: size.height*0.06,
                                      width:  size.width/2*0.1,
                                    ),
                                    //nome qtd
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: size.height*0.03,
                                          width:  size.width/2*0.5,
                                        ),
                                        SizedBox(
                                          height: size.height*0.03,
                                          width:  size.width/2*0.5,
                                        ),
                                      ],
                                    ),
                                    //´preço
                                    SizedBox(
                                      height: size.height*0.06,
                                      width:  size.width/2*0.1,
                                      child: FittedBox(
                                        fit: BoxFit.scaleDown,
                                        child: Text("R\$ 10,00", style: AppTextStyles.labelBlack18,),
                                      )
                                    ),
                                  ],
                                ),
                              ),
                            );
                     }),
                   )
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

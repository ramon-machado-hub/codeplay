import 'package:codeplay/themes/app_images.dart';
import 'package:codeplay/themes/app_colors.dart';
import 'package:codeplay/themes/app_text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool _check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: AppColors.white, // Defina a cor do ícone de volta desejada
        ),
        backgroundColor: AppColors.primaryColor,
        title: Row(

          children: [
            Icon(Icons.location_on, color: AppColors.white,),
            Text("RUA H, 72", style: AppTextStyles.titleAppbar,),
          ],
        ),
        actions: [
          Padding(padding: EdgeInsets.only(right: 30),
            child: Icon(Icons.shopping_cart_outlined, color: AppColors.white,),
          )
        ],
        // centerTitle: true,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        color: Colors.white,
        child: Column(
          children: [
            Card(
              child: Container(
                width: size.width,
                height: size.height*0.2,
                color: AppColors.white,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 15,
                    itemBuilder: (BuildContext, index){
                      return InkWell(
                        onTap: (){
                              _check = true;
                              setState(() {
                                print("check");
                              });
                        },
                        child: Card(
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                    width: size.width*0.07,
                                    height: size.height*0.14,
                                    child: Image.asset(
                                        AppImages.supermercado
                                    )
                                  // Container(color: Colors.amber,),
                                ),
                                SizedBox(
                                  // color: Colors.red,
                                  width: size.width*0.07,
                                  height: size.height*0.04,
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text("SUPER",style: AppTextStyles.labelBlack18,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
              (_check)?
            Center(
              child: InkWell(
                onTap: (){
                    Navigator.pushNamed(context, "/enderecos");
                },
                child: Container(
                    color: Colors.amber,
                    height: size.height*0.1,
                    width: size.width*0.1,
                    child: Center(child: Text("Registrar Pedido"),)
                ),
              )
            )
              :
            Center(),
          ],
        ),

      ),
    );
  }
}

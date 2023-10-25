import 'package:codeplay/provider/enderecos_provider.dart';
import 'package:codeplay/views/cadastrar_endereco.dart';
import 'package:codeplay/views/enderecos.dart';
import 'package:codeplay/views/finalizar_pedido.dart';
import 'package:codeplay/views/home.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => EnderecoProvider(),)
      ],
      child: MaterialApp(

        title: 'CODEPLAY',
        theme: ThemeData(
          useMaterial3: true,
          // primaryColor: AppColors.primaryColor,
        ),
        home: Home(),
        routes: {
          "/cadastrar_endereco": (context) => const CadastroEndereco(),
          "/enderecos": (context) => const Enderecos(),
          "/finalizar_pedido": (context) => const FinalizarPedido(),
        },
      )
    );
  }
}

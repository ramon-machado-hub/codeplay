import 'package:codeplay/views/cadastrar_endereco.dart';
import 'package:codeplay/views/enderecos.dart';
import 'package:codeplay/views/finalizar_pedido.dart';
import 'package:codeplay/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'components/google.dart';

class AppWidget extends StatelessWidget {
  AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(

        title: 'CODEPLAY',
      theme: ThemeData(
        useMaterial3: true,
        // primaryColor: AppColors.primaryColor,
      ),
      home: Enderecos(),
      routes: {
        "/cadastrar_endereco": (context) => const CadastroEndereco(),
      },
    );
  }
}

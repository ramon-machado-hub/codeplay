import 'package:flutter/cupertino.dart';

import '../model/endereco_model.dart';

class EnderecoProvider with ChangeNotifier{
  List<EnderecoModel> list = [];

  void cadastroEndereco(EnderecoModel endereco){
    list.add(endereco);
  }

}
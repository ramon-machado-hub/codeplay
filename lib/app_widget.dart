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
      home: Maps(),
      routes: {

      },
    );
  }
}

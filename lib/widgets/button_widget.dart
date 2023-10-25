import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_text_styles.dart';

class ButtonWidget extends StatefulWidget {
  final String label;
  final double width;
  final double height;
  final VoidCallback onTap;
  const ButtonWidget({
    Key? key,
    required this.onTap,
    required this.label,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: widget.width,
      height: widget.height,
      child:  ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: AppColors.primaryColor,
          onPrimary: Colors.white,
          shadowColor: Colors.greenAccent,
          elevation: 3,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)),
          minimumSize: Size(widget.width, widget.height), //////// HERE
        ),
        onPressed: widget.onTap,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text( widget.label,
            style: AppTextStyles.labelBoldWhite18,),
        )
      ),
    );
  }
}

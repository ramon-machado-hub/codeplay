import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:codeplay/themes/app_colors.dart';

class InputTextWidget extends StatefulWidget {
  final double heigth;
  final String initalValue;
  final String label;
  final Color backgroundColor;
  final Color borderColor;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(String value)? onChanged;
  final TextStyle textStyle;
  

  const InputTextWidget({
    Key? key,

    required this.heigth,
    required this.label,
    required this.keyboardType,
    required this.backgroundColor,
    required this.borderColor,
    required this.textStyle,
    this.onChanged,
    required this.initalValue,
    this.validator,
    this.controller}) : super(key: key);

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  @override
  Widget build(BuildContext context) {
    print(widget.initalValue);
    print("widget.initalValue");
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: AppColors.black,
          width: 1.0,
        ),
      ),
      child: TextFormField(
        textAlign: TextAlign.start,
        enableSuggestions: false,
        autocorrect: false,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        initialValue: widget.initalValue,
        validator: widget.validator,
        onChanged: widget.onChanged,
        decoration: InputDecoration(
            fillColor: widget.backgroundColor,
            labelText: widget.label,
            labelStyle: widget.textStyle,
            border: InputBorder.none),

      ),
    );
  }
}

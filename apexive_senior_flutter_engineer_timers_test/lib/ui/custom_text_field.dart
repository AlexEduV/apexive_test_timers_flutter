
import 'package:flutter/material.dart';

import '../style/typography.dart';

class CustomTextField extends StatefulWidget {
  
  final TextEditingController textEditingController;
  final String hintText;
  final int? maxLength;

  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    this.maxLength,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
  
}

class _CustomTextFieldState extends State<CustomTextField> {

  static TextStyle defaultTextStyle = TypographyStyles.getBodyLarge();
  
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Colors.white.withOpacity(.16),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintStyle: defaultTextStyle,
          labelText: widget.hintText,
          labelStyle: defaultTextStyle,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        maxLength: widget.maxLength,
        textInputAction: TextInputAction.next,
        controller: widget.textEditingController,
        style: defaultTextStyle,
        cursorColor: Colors.white,
      ),
    );
  }
}

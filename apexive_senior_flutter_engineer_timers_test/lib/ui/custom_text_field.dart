
import 'package:flutter/material.dart';

import '../style/typography.dart';

class CustomTextField extends StatefulWidget {
  
  final TextEditingController textEditingController;
  final String hintText;
  final int maxLength;

  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.hintText,
    required this.maxLength,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
  
}

class _CustomTextFieldState extends State<CustomTextField> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Colors.white.withOpacity(.16),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        decoration: InputDecoration(
          //hoverColor: Colors.transparent,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          hintStyle: TypographyStyles().getBodyLarge(),
          hintText: widget.hintText,
          counterText: "",),
        //cursorColor: Colors.transparent,
        enabled: true,
        maxLength: widget.maxLength,
        textInputAction: TextInputAction.next,
        controller: widget.textEditingController,
        style: TypographyStyles().getBodyLarge(),

      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  
  final TextEditingController textEditingController;
  final String hintText;
  final int? maxLength;

  const CustomTextField({
    required this.textEditingController,
    required this.hintText,
    this.maxLength,
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
  
}

class _CustomTextFieldState extends State<CustomTextField> {
  
  @override
  Widget build(BuildContext context) {

    return DecoratedBox(
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
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          labelText: widget.hintText,
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        maxLength: widget.maxLength,
        textInputAction: TextInputAction.next,
        controller: widget.textEditingController,
        style: Theme.of(context).textTheme.bodyLarge,
        cursorColor: Colors.white,
      ),
    );
  }
}

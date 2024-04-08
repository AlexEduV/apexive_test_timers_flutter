import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {

  final Function() onBackButtonPressed;
  final String title;
  final TextStyle titleTextStyle;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    required this.onBackButtonPressed,
    required this.title,
    required this.titleTextStyle,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: AppBar(

        leading: IconButton(
          onPressed: onBackButtonPressed,
          icon: Image.asset(
            'assets/images/chevron_left.png',
            color: Colors.white,
            height: 24,
            width: 24,
          ),
        ),

        title: Text(title),
        titleTextStyle: titleTextStyle,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        actions: actions,
      ),
    );
  }
}

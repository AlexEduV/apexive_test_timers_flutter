import 'package:flutter/material.dart';

import '../style/typography.dart';

class CustomAppBar extends StatelessWidget {

  final Function() onBackButtonPressed;
  final String title;

  const CustomAppBar({
    super.key,
    required this.onBackButtonPressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: AppBar(
        title: Text(title, style: TypographyStyles.getHeadlineSmall(),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: onBackButtonPressed,
          icon: const Icon(Icons.arrow_back_ios, size: 24, color: Colors.white,),),
      ),
    );
  }



}

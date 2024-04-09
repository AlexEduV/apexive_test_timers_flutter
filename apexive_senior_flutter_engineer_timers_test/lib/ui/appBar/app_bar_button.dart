import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {

  final String iconSource;
  final Function() onTap;

  const AppBarButton({super.key, required this.iconSource, required this.onTap});

  @override
  Widget build(BuildContext context) {
   return Container(
     height: 48,
     width: 48,
     decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(12),
         color: Colors.white.withOpacity(.16),
     ),
     //padding: const EdgeInsets.all(8.0),
     child: IconButton(
       icon: Image.asset(
         iconSource,
         color: Colors.white,
         height: 24,
         width: 24,
       ),
       onPressed: onTap,
     ),
   );

  }
}

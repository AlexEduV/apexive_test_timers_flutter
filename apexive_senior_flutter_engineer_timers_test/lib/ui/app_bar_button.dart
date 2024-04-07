import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {

  final IconData icon;
  final Function() onTap;

  const AppBarButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
   return Container(
     height: 48,
     width: 48,
     decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(12),
         color: const Color(0x29ffffff)
     ),
     //padding: const EdgeInsets.all(8.0),
     child: IconButton(
       icon: Icon(icon, color: Colors.white),
       onPressed: onTap,
     ),
   );

  }
}


import 'package:flutter/material.dart';

class MyAppBar extends AppBar implements PreferredSizeWidget {

  MyAppBar({super.key, required Widget title, required List<Widget>? actions});

  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: AppBar(
        title: title,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        //titleSpacing: 24,
        actions: actions
      ), //or row/any widget
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

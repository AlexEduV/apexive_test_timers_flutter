
import 'package:flutter/material.dart';

import '../style/typography.dart';

class DropDownSelector extends StatefulWidget {

  final List<DropdownMenuEntry<String>> menuItems;

  late String? selectedValue;
  final String hintText;

  final Function(String?) onChanged;

  DropDownSelector({
    super.key,
    required this.menuItems,
    required this.selectedValue,
    required this.hintText,
    required this.onChanged,
  });

  @override
  State<DropDownSelector> createState() => _DropDownSelectorState();

}

class _DropDownSelectorState extends State<DropDownSelector> {

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
      child: DropdownMenu<String>(
        dropdownMenuEntries: widget.menuItems,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TypographyStyles.getBodyLarge(),
          hintStyle: TypographyStyles.getBodyLarge(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)

        ),
        menuStyle: MenuStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            return Colors.white.withOpacity(.12);
          }),
          surfaceTintColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
            return Colors.white;
          }),
        ),
        expandedInsets: EdgeInsets.zero,
        hintText: widget.hintText,
        label: Text(widget.hintText),
        textStyle: TypographyStyles.getBodyLarge(),
        trailingIcon: Image.asset(
          'assets/images/chevron_down.png',
          height: 32,
          width: 32,
          color: Colors.white,
        ),
      ),
    );
  }

}


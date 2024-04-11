
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
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        children: [
          DropdownMenu<String>(
            dropdownMenuEntries: widget.menuItems,
            //value: widget.selectedValue,
            //onChanged: widget.onChanged,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TypographyStyles.getBodyLarge(),
              hintStyle: TypographyStyles.getBodyLarge()

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
            textStyle:  TypographyStyles.getBodyLarge(),
            //underline: Container(),
            trailingIcon: const Icon(Icons.expand_more, size: 32, color: Colors.white,),
            //isExpanded: true,
            //borderRadius: BorderRadius.circular(8),
            //dropdownColor: Colors.white.withOpacity(.67),
          ),
        ],
      ),
    );
  }

}


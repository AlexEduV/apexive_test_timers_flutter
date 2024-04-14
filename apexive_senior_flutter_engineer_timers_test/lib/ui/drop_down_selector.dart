
import 'package:flutter/material.dart';

import '../style/typography.dart';

class DropDownSelector extends StatelessWidget {

  final List<DropdownMenuEntry<String>> menuItems;

  late String? selectedValue;
  final String hintText;

  final Function(String?) onSelected;

  DropDownSelector({
    super.key,
    required this.menuItems,
    required this.selectedValue,
    required this.hintText,
    required this.onSelected,
  });

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
        dropdownMenuEntries: menuItems,
        onSelected: onSelected,
        label: Text(hintText),
        textStyle: TypographyStyles.getBodyLarge(),
        trailingIcon: getTrailingIcon(),
        selectedTrailingIcon: getTrailingIcon(),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TypographyStyles.getBodyLarge(),
          hintStyle: TypographyStyles.getBodyLarge(),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
          ),
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
      ),
    );
  }

  Widget getTrailingIcon({String iconSource = 'assets/images/chevron_down.png'})
  {
    return Image.asset(
        iconSource,
        height: 24,
        width: 24,
        color: Colors.white,
    );
  }

}

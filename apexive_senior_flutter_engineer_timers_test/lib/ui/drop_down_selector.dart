
import 'package:flutter/material.dart';

class DropDownSelector extends StatelessWidget {

  final List<DropdownMenuEntry<String>> menuItems;

  late String? selectedValue;
  final String hintText;

  final Function(String?) onSelected;

  DropDownSelector({
    required this.menuItems,
    required this.selectedValue,
    required this.hintText,
    required this.onSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2.0,
          color: Colors.white.withOpacity(0.16),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownMenu<String>(
        dropdownMenuEntries: menuItems,
        onSelected: onSelected,
        label: Text(hintText),
        textStyle: Theme.of(context).textTheme.bodyLarge,
        trailingIcon: getTrailingIcon(),
        selectedTrailingIcon: getTrailingIcon(),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: Theme.of(context).textTheme.bodyLarge,
          hintStyle: Theme.of(context).textTheme.bodyLarge,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
          ),
        ),
        menuStyle: MenuStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> _) {
            return Colors.white.withOpacity(0.12);
          }),
          surfaceTintColor: MaterialStateProperty.resolveWith<Color>((Set<MaterialState> _) {
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

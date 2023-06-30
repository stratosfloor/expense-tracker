import 'package:flutter/material.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import '../../models/expense.dart';

class NewExpenseDropdown extends StatelessWidget {
  const NewExpenseDropdown({
    super.key,
    required this.selectedCategory,
    required this.onChangeDropdown,
  });

  final Category selectedCategory;
  final void Function(Category? value) onChangeDropdown;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: selectedCategory,
      items: Category.values
          .map(
            (cat) => DropdownMenuItem(
              value: cat,
              child: Text(
                toBeginningOfSentenceCase(cat.name)!,
              ),
            ),
          )
          .toList(),
      onChanged: (val) {
        onChangeDropdown(val);
      },
    );
  }
}

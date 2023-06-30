import 'package:expense_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewExpenseDatepicker extends StatelessWidget {
  const NewExpenseDatepicker({
    super.key,
    required this.selectedDate,
    required this.presentDatePicker,
  });

  final DateTime? selectedDate;
  final void Function() presentDatePicker;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(selectedDate != null
            ? formatter.format(selectedDate!)
            : 'No date selected'),
        // : formatter.format(DateTime.now())),
        IconButton(
          onPressed: presentDatePicker,
          icon: const Icon(Icons.calendar_month),
        )
      ],
    );
  }
}

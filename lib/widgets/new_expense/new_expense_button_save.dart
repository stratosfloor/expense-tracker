import 'package:flutter/material.dart';

class NewExpenseButtonSave extends StatelessWidget {
  const NewExpenseButtonSave({
    super.key,
    required this.submitExpenseData,
  });

  final void Function() submitExpenseData;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: submitExpenseData,
      child: const Text('Save Expense'),
    );
  }
}

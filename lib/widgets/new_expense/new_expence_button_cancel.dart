import 'package:flutter/material.dart';

class NewExpenseButtonCancel extends StatelessWidget {
  const NewExpenseButtonCancel({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: const Text('Cancel'),
    );
  }
}

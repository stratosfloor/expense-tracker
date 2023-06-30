import 'package:flutter/material.dart';

class NewExpenseAmount extends StatelessWidget {
  const NewExpenseAmount({super.key, required this.amountController});

  final TextEditingController amountController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: amountController,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        prefixText: '\$ ',
        label: Text('Amount'),
        // hintText: 'Enter amount',
      ),
    );
  }
}

import 'package:flutter/material.dart';

class NewExpenseTitle extends StatelessWidget {
  const NewExpenseTitle({super.key, required this.titleController});

  final TextEditingController titleController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: titleController,
      maxLength: 50,
      autofocus: false,
      decoration: const InputDecoration(
        label: Text('Title'),
        hintText: 'Enter Title',
      ),
    );
  }
}

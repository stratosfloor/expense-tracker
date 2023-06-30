import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense/new_expence_button_cancel.dart';
import 'package:expense_tracker/widgets/new_expense/new_expense_amount.dart';
import 'package:expense_tracker/widgets/new_expense/new_expense_button_save.dart';
import 'package:expense_tracker/widgets/new_expense/new_expense_datepicker.dart';
import 'package:expense_tracker/widgets/new_expense/new_expense_dropdown.dart';
import 'package:expense_tracker/widgets/new_expense/new_expense_title.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addExpense});

  final void Function(Expense expense) addExpense;

  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.drinks;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;

    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text(
              'Please make sure valid title, amount and category was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            )
          ],
        ),
      );
      return;
    }
    widget.addExpense(
      Expense(
        title: _titleController.text,
        amount: enteredAmount,
        date: _selectedDate!,
        category: _selectedCategory,
      ),
    );
    Navigator.pop(context);
  }

  void _onChangeDropdown(Category? value) {
    if (value == null) return;
    setState(() {
      _selectedCategory = value;
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(builder: (ctx, contraints) {
      final width = contraints.maxWidth;

      return SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(16, 16, 16, keyboardSpace + 16),
            child: Column(
              children: [
                if (width >= 600)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: NewExpenseTitle(
                              titleController: _titleController)),
                      const SizedBox(width: 24),
                      Expanded(
                        child: NewExpenseAmount(
                            amountController: _amountController),
                      ),
                    ],
                  )
                else
                  NewExpenseTitle(titleController: _titleController),
                if (width >= 600)
                  Row(
                    children: [
                      NewExpenseDropdown(
                          selectedCategory: _selectedCategory,
                          onChangeDropdown: _onChangeDropdown),
                      const SizedBox(width: 24),
                      Expanded(
                        child: NewExpenseDatepicker(
                          selectedDate: _selectedDate,
                          presentDatePicker: _presentDatePicker,
                        ),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      Expanded(
                        child: NewExpenseAmount(
                          amountController: _amountController,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: NewExpenseDatepicker(
                          selectedDate: _selectedDate,
                          presentDatePicker: _presentDatePicker,
                        ),
                      )
                    ],
                  ),
                const SizedBox(height: 16),
                if (width >= 600)
                  Row(
                    children: [
                      const Spacer(),
                      const NewExpenseButtonCancel(),
                      NewExpenseButtonSave(
                          submitExpenseData: _submitExpenseData),
                    ],
                  )
                else
                  Row(
                    children: [
                      NewExpenseDropdown(
                        selectedCategory: _selectedCategory,
                        onChangeDropdown: _onChangeDropdown,
                      ),
                      const Spacer(),
                      const NewExpenseButtonCancel(),
                      NewExpenseButtonSave(
                          submitExpenseData: _submitExpenseData),
                    ],
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}

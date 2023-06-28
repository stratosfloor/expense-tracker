import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter course',
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Beer',
        amount: 99999,
        date: DateTime.now(),
        category: Category.leisure),
    Expense(
        title: 'Cinema',
        amount: 1337,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
            child: ExpensesList(expenses: _registeredExpenses),
          )
        ],
      ),
    );
  }
}

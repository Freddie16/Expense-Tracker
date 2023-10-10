import 'package:flutter/material.dart';

import 'expenses_list/expenses_list.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: "Rent",
      amount: 10,
      date: DateTime.now(),
      category: Category.bills,
    ),
    Expense(
      title: "Course",
      amount: 19.78,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: "Cinema",
      amount: 6.87,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Text('Modal Sheet Clicked'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Expense Tracker'),
          backgroundColor: const Color.fromARGB(255, 15, 38, 57),
          actions: [
            IconButton(
              icon: const Icon(Icons.add_circle_sharp),
              onPressed: _openAddExpenseOverlay,
            )
          ], // for adding action button in the right side of toolbar
        ),
        backgroundColor: Color.fromARGB(255, 227, 222, 222),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Expense',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: ExpensesList(expenses: _registeredExpenses),
              ),
            ],
          ),
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(10),
          width: double
              .infinity, //container takes up all the space available  //padding around the container
        ),
      ),
    );
  }
}

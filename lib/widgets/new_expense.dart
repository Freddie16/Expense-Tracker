import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key});

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _dateController = TextEditingController();


  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixText: '\$ ',
              labelText: 'Amount'),
          ),
          TextField(
            controller: _dateController,
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(labelText: 'Date'),
          ),
          Row(
            children: [
              TextButton(onPressed: () {
                Navigator.of(context).pop();
              }
              , child: Text('Cancel'),  
              ),
              SizedBox(width: 176.0),
          ElevatedButton(
            onPressed: () {
              print(_titleController.text);
               print(_amountController.text);
                print(_dateController.text);
            },
            child: Text(
                'Add Expense'), // TODO: change to primaryColor when it is available in the themey
          ),
            ],
          ),
        ],
      ),
    );
  }
}

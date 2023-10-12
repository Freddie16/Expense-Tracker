import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
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
              decoration: InputDecoration(
                labelText: 'Date',
                prefixIcon: Icon(Icons.calendar_today),
              ),
              controller: _dateController,
              onTap: () async {
                final DateTime? selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2021),
                  lastDate: DateTime.now(),
                );

                if (selectedDate != null) {
                  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
                  _dateController.text = dateFormat.format(selectedDate);
                }
              },
            ),
            Row(
              children: [
                DropdownButton(
                  items: Category.values.map(
                    (category) => DropdownMenuItem(
                      value: category,
                      child: Text
                (category.name.toString(),
                ),
                ),
                ).toList(),
                 onChanged: (value) {}),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                SizedBox(width: 176.0),
                ElevatedButton(
                  onPressed: () {
                    print(_titleController.text);
                    print(_amountController.text);
                    print(_dateController.text);
                  },
                  child: Text('Add Expense'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
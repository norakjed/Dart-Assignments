import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  final Function(Expense) onExpenseCreated;
  const ExpenseForm({super.key, required this.onExpenseCreated});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category _selectedCategory = Category.leisure;
  DateTime date = DateTime.now();

  void onCreate() {
    // 1 - Create the new expense
    final title = _titleController.text.trim();
    final amountText = _amountController.text.trim();
    final amount = double.tryParse(amountText);

    // Show error popup if invalid (empty title or invalid/negative amount)
    if (title.isEmpty || amount == null || amount <= 0) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
            'Please enter a valid title and positive amount.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      return; 
    }

    Expense newExpense = Expense(
      title: title,
      amount: amount,
      date: date,
      category: _selectedCategory,
    );

    // 2  - Forward the new expense to the parent
    widget.onExpenseCreated(newExpense);

    // 3- Close the modal
    Navigator.pop(context);
  }

  void onCancel() {
    Navigator.pop(context);
  }

  Future<void> datePicker() async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (newDate != null) {
      setState(() {
        date = newDate;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _amountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          TextField(
            controller: _amountController,
            decoration: InputDecoration(
              label: Text("Amount"),
              prefixText: '\$',
            ),
            maxLength: 50,
          ),
          Row(
            children: [
              Text(DateFormat('MM/dd/yyyy').format(date)),
              IconButton(
                onPressed: datePicker,
                icon: Icon(Icons.calendar_month),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: DropdownButton<Category>(
                  value: _selectedCategory,
                  isExpanded: true,
                  items: Category.values.map((type) {
                    return DropdownMenuItem(
                      value: type,
                      child: Text(type.toString().split('.').last),
                    );
                  }).toList(),
                  onChanged: (Category? value) {
                    if (value != null) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    }
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onCancel,
                          child: Text("Cancel"),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onCreate,
                          child: Text("Create"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

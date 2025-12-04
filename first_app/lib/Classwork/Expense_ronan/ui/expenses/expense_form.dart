import 'package:first_app/Classwork/Expense_ronan/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  String titleValue = '';
  final _titleController = TextEditingController();
  String amountValue = '';
  final _amountController = TextEditingController();
  Category category = Category.leisure;

  void onTitleChanged(String newValue) {
    setState(() {
      titleValue = _titleController.text;
      amountValue = _amountController.text;
    });
  }



  void onCreate() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text) ?? 0.0;

    Expense expense = Expense(
      title: title,
      amount: amount,
      date: DateTime.now(),
      category: category,
    );
  }

  void onCancel() {
    Navigator.pop(context);
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
            onChanged: onTitleChanged,
            controller: _titleController,
            decoration: InputDecoration(label: Text("Title")),
            maxLength: 50,
          ),
          // Text("Value is $titleValue"),
          TextField(
            onChanged: onTitleChanged,
            controller: _amountController,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              label: Text("Amount"),
              prefixText: '\$',
            ),
            maxLength: 50,
          ),
          // Text("Value is $amountValue"),
          ElevatedButton(onPressed: onCreate, child: Text("Create")),
          ElevatedButton(onPressed: onCancel, child: Text("Cancel")),
        ],
        
      ),
    );
  }
}

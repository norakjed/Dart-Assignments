import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'expenses/expense_form.dart';
import 'expenses/expenses.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Expense> _expenses = [];  // ← Store expenses here

  // Add new expense to the list
  void _addExpense(Expense newExpense) {
    setState(() {
      _expenses.add(newExpense);
    });
  }

  // Open the expense form modal
  void onAddClicked(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,  // ← Allow keyboard to show properly
      context: context,
      builder: (ctx) => ExpenseForm(
        onExpenseCreated: _addExpense,  // ← Pass callback
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => onAddClicked(context),  // ← Remove unnecessary {}
            icon: const Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: ExpensesView(expenses: _expenses),  // ← Pass expenses
    );
  }
}


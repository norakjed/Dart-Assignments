import 'package:flutter/material.dart';
import '../models/expense.dart';
import 'expenses/expense_form.dart';
import 'expenses/expense_list.dart';
import 'expenses/expense_category.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Pizza',
      amount: 15.00,
      date: DateTime.now().subtract(const Duration(days: 1)),
      category: Category.food,
    ),
    Expense(
      title: 'Spain',
      amount: 250.00,
      date: DateTime.now().subtract(const Duration(days: 2)),
      category: Category.travel,
    ),
    Expense(
      title: 'PS5',
      amount: 500.00,
      date: DateTime.now().subtract(const Duration(days: 3)),
      category: Category.leisure,
    ),
    Expense(
      title: 'Macbook Pro',
      amount: 1000.00,
      date: DateTime.now().subtract(const Duration(days: 4)),
      category: Category.work,
    ),
  ];
  //  Store expenses

  // Add new expense to the list
  void _addExpense(Expense newExpense) {
    setState(() {
      _expenses.add(newExpense);
    });
  }

  // Open the expense form modal
  void onAddClicked(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true, //  Allow keyboard to show properly
      context: context,
      builder: (ctx) => ExpenseForm(
        onExpenseCreated: _addExpense, //  Pass callback
      ),
    );
  }

  void _onExpenseDismissed(int index) {
    final removedExpense = _expenses[index];
    setState(() {
      _expenses.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenses.insert(index, removedExpense);
            });
          },
        ),
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
            onPressed: () => onAddClicked(context),
            icon: const Icon(Icons.add),
          ),
        ],
        backgroundColor: Colors.blue[700],
        title: const Text('Ronan-The-Best Expenses App'),
      ),
      body: Column(
        children: [
          CategoryCardRow(expenses: _expenses),
          const SizedBox(height: 16),
          Expanded(
            child: ExpensesList(
              expenses: _expenses,
              onDismissed: _onExpenseDismissed,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expense_item.dart';

class ExpensesList extends StatelessWidget {
  final List<Expense> expenses;
  final void Function(int index) onDismissed;

  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onDismissed,
  });

  @override
  Widget build(BuildContext context) {
    return expenses.isEmpty
        ? const Center(
            child: Text(
              'No expenses yet. Add one!',
              style: TextStyle(fontSize: 18),
            ),
          )
        : ListView.builder(
            itemCount: expenses.length,
            itemBuilder: (context, index) => Dismissible(
              key: ValueKey(expenses[index]), // Unique key for each item
              direction:
                  DismissDirection.endToStart, // Swipe from right to left
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(right: 20),
                child: const Icon(Icons.delete, color: Colors.white),
              ),
              onDismissed: (direction) {
                onDismissed(index); // Call the callback to handle removal
              },
              child: ExpenseItem(expense: expenses[index]),
            ),
          );
  }
}

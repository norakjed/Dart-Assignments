import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpensesView extends StatelessWidget {  // ← Changed to StatelessWidget
  final List<Expense> expenses;  // ← Add this parameter

  const ExpensesView({
    super.key,
    required this.expenses,  // ← Add this
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
            itemBuilder: (context, index) => ExpenseItem(
              expense: expenses[index],
            ),
          );
  }
}

// ExpenseItem widget (keep as is or update)
class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  IconData get expenseIcon {
    switch (expense.category) {
      case Category.food:
        return Icons.restaurant;
      case Category.travel:
        return Icons.flight;
      case Category.leisure:
        return Icons.movie;
      case Category.work:
        return Icons.work;
    }
  }

  String get expenseDate {
    return "${expense.date.day}/${expense.date.month}/${expense.date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Icon(expenseIcon, color: Colors.blue[700]),
                const SizedBox(width: 8),
                Text(expenseDate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
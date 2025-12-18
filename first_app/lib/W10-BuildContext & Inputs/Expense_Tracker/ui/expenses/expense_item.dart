import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expense_category.dart';

// ExpenseItem widget
class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

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
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Icon(
                  ExpenseCategory(category: expense.category, total: 0).icon,
                  color: Colors.blue[700],
                ),
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

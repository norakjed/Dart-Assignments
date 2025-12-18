import 'package:flutter/material.dart';
import '../../models/expense.dart';

class ExpenseCategory extends StatelessWidget {
  final Category category;
  final double total;

  const ExpenseCategory({
    super.key,
    required this.category,
    required this.total,
  });

  IconData getIcon(Category category) {
    switch (category) {
      case Category.food:
        return Icons.fastfood;
      case Category.travel:
        return Icons.directions_car;
      case Category.leisure:
        return Icons.movie;
      case Category.work:
        return Icons.work;
    }
  }

  IconData get icon => getIcon(category);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Icon(icon, size: 28),
          const SizedBox(height: 6),
          Text(
            category.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            '\$${total.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}

class CategoryCardRow extends StatelessWidget {
  final List<Expense> expenses;

  const CategoryCardRow({super.key, required this.expenses});

  double _calculateTotal(Category type) {
    double sum = 0;
    for (var expense in expenses) {
      if (expense.category == type) {
        sum += expense.amount;
      }
    }
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: Category.values.map((type) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ExpenseCategory(
                  category: type,
                  total: _calculateTotal(type),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

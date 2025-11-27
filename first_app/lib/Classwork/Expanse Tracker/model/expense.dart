import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum ExpenseType { food, travel, leisure, work }

const uuid = Uuid();

class Expense {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType category;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}

main() {
  runApp(MaterialApp());
}

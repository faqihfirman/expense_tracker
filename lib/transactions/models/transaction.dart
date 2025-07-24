import 'package:flutter/material.dart';
import 'package:expense_tracker/categories/models/category.dart';

enum TransactionType { expense, income }

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final TransactionType type;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
    required this.type,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) {
    final categoryId = json['category_id'] as String;
    final category = defaultCategories.firstWhere(
      (cat) => cat.id == categoryId,
      orElse: () =>
          Category(id: 'unknown', name: 'Unknown', type: CategoryType.expense),
    );

    return Transaction(
      id: json['id'] as String,
      title: json['title'] as String,
      amount: json['amount'] as double,
      date: DateTime.parse(json['date'] as String),
      category: category,
      type: TransactionType.values.firstWhere(
        (e) => e.toString() == 'TransactionType.' + json['type'],
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
      'category_id': category.id,
      'type': type.toString().split('.').last,
    };
  }
}

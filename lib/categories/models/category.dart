import 'package:flutter/material.dart';

enum CategoryType { expense, income }

class Category {
  final String id;
  final String name;
  final CategoryType type;
  final IconData? icon;
  final Color? color;

  Category({
    required this.id,
    required this.name,
    required this.type,
    this.icon,
    this.color,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as String,
      name: json['name'] as String,
      type: CategoryType.values.firstWhere(
        (e) => e.toString() == 'CategoryType.' + json['type'],
      ),
      icon: json['iconCodePoint'] != null
          ? IconData(json['iconCodePoint'], fontFamily: 'MaterialIcons')
          : null,
      color: json['colorValue'] != null ? Color(json['colorValue']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type.toString().split('.').last,
      'iconCodePoint': icon?.codePoint,
      'colorValue': color?.value,
    };
  }
}

List<Category> defaultCategories = [
  Category(
    id: 'c1',
    name: 'Makanan',
    type: CategoryType.expense,
    icon: Icons.fastfood,
    color: Colors.orange,
  ),
  Category(
    id: 'c2',
    name: 'Kebutuhan Kos',
    type: CategoryType.expense,
    icon: Icons.home,
    color: Colors.blueGrey,
  ),
  Category(
    id: 'c3',
    name: 'Kuliah',
    type: CategoryType.expense,
    icon: Icons.school,
    color: Colors.purple,
  ),
  Category(
    id: 'c4',
    name: 'Internet',
    type: CategoryType.expense,
    icon: Icons.wifi,
    color: Colors.indigo,
  ),
  Category(
    id: 'c5',
    name: 'Transportasi',
    type: CategoryType.expense,
    icon: Icons.directions_bus,
    color: Colors.teal,
  ),
  Category(
    id: 'c6',
    name: 'Hiburan',
    type: CategoryType.expense,
    icon: Icons.movie,
    color: Colors.pink,
  ),
  Category(
    id: 'c7',
    name: 'Gaji',
    type: CategoryType.income,
    icon: Icons.attach_money,
    color: Colors.green,
  ),
  Category(
    id: 'c8',
    name: 'Bonus',
    type: CategoryType.income,
    icon: Icons.card_giftcard,
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c9',
    name: 'Lain-lain (Pengeluaran)',
    type: CategoryType.expense,
    icon: Icons.more_horiz,
    color: Colors.grey,
  ),
  Category(
    id: 'c10',
    name: 'Lain-lain (Pemasukan)',
    type: CategoryType.income,
    icon: Icons.more_horiz,
    color: Colors.grey[700],
  ),
];

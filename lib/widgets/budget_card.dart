import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BudgetCard extends StatelessWidget {
  final String label;
  final double amount;

  BudgetCard({required this.label, required this.amount});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'es_MX');
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(label),
        trailing: Text(formatCurrency.format(amount)),
      ),
    );
  }
}

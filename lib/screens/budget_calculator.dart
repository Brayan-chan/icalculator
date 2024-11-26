import 'package:flutter/material.dart';
import '../services/firestore_service.dart';
import '../widgets/budget_card.dart';

class BudgetCalculatorScreen extends StatefulWidget {
  @override
  _BudgetCalculatorScreenState createState() => _BudgetCalculatorScreenState();
}

class _BudgetCalculatorScreenState extends State<BudgetCalculatorScreen> {
  final TextEditingController _budgetController = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();
  double _needs = 0.0, _wants = 0.0, _savings = 0.0;

  void _calculateAndSaveBudget() async {
    if (_budgetController.text.isNotEmpty) {
      double budget = double.parse(_budgetController.text);
      setState(() {
        _needs = budget * 0.5;
        _wants = budget * 0.3;
        _savings = budget * 0.2;
      });

      await _firestoreService.saveBudget({
        'totalBudget': budget,
        'needs': _needs,
        'wants': _wants,
        'savings': _savings,
        'createdAt': DateTime.now(),
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Presupuesto guardado con éxito")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculadora 50/30/20")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _budgetController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Presupuesto total",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateAndSaveBudget,
              child: Text("Calcular y Guardar"),
            ),
            SizedBox(height: 30),
            if (_needs > 0) BudgetCard(label: "Necesidades", amount: _needs),
            if (_wants > 0) BudgetCard(label: "Deseos", amount: _wants),
            if (_savings > 0) BudgetCard(label: "Ahorros", amount: _savings),
          ],
        ),
      ),
    );
  }
}

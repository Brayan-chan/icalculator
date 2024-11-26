import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SavedBudgetsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Presupuestos Guardados")),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('budgets').orderBy('createdAt', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final budgets = snapshot.data!.docs;
          return ListView.builder(
            itemCount: budgets.length,
            itemBuilder: (context, index) {
              final budget = budgets[index];
              return ListTile(
                title: Text("Presupuesto: \$${budget['totalBudget']}"),
                subtitle: Text(
                  "Necesidades: \$${budget['needs']}, Deseos: \$${budget['wants']}, Ahorros: \$${budget['savings']}",
                ),
              );
            },
          );
        },
      ),
    );
  }
}

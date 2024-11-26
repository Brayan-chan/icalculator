import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference _budgetsCollection =
      FirebaseFirestore.instance.collection('budgets');

  Future<void> saveBudget(Map<String, dynamic> budget) {
    return _budgetsCollection.add(budget);
  }
}

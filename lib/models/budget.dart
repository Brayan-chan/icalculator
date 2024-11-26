class Budget {
  final double totalBudget;
  final double needs;
  final double wants;
  final double savings;

  Budget({
    required this.totalBudget,
    required this.needs,
    required this.wants,
    required this.savings,
  });

  Map<String, dynamic> toMap() {
    return {
      'totalBudget': totalBudget,
      'needs': needs,
      'wants': wants,
      'savings': savings,
    };
  }

  factory Budget.fromMap(Map<String, dynamic> map) {
    return Budget(
      totalBudget: map['totalBudget'],
      needs: map['needs'],
      wants: map['wants'],
      savings: map['savings'],
    );
  }
}

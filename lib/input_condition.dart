class InputCondition {
  final int value;
  final String label;
  InputCondition({required this.value, required this.label});

  @override
  String toString() {
    return label;
  }
}
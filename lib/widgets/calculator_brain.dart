import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;

  double? _hello;

  String calculateBMI() {
    _hello = weight / pow(height / 100, 2);
    return _hello!.toStringAsFixed(1);
  }

  String getResult() {
    if (_hello! >= 25) {
      return 'Overweight';
    } else if (_hello! > 18.5) {
      return 'Normal';
    } else {
      return ' Underweight';
    }
  }
}

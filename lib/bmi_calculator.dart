import 'dart:math';

class BMICalculator {
  final int height;
  final int weight;

  double _bmi;

  BMICalculator({this.height, this.weight});

  void _computeBMI() {
    if (_bmi == null) {
      _bmi = weight / pow(height / 100, 2);
    }
  }

  String getBMI() {
    _computeBMI();
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    _computeBMI();
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    _computeBMI();
    if (_bmi >= 25) {
      return 'You are higher than normal body weight. Try exercise more.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}

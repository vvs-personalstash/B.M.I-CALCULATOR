import 'dart:math';

class BMI_BRAIN {
  BMI_BRAIN({required this.height, required this.weight});
  final int? height;
  final int? weight;
  late double _bmi;
  String Bmi_Calculate() {
    _bmi = weight! / pow((height! / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String BmiText() {
    return _bmi > 25
        ? 'Overweight'
        : _bmi > 18
            ? 'Normal'
            : 'Underweight';
  }

  String BmiComment() {
    return _bmi > 25
        ? 'You are Overweight,Please eat less!'
        : _bmi > 18
            ? 'You have a normal B.M.I'
            : 'You are Malnourished,please eat more!';
  }
}

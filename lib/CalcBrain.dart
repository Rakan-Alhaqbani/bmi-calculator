import 'dart:math';
import 'package:flutter/material.dart';

class CalcBrain {
  CalcBrain({required this.weight, required this.height}) {}
  double _bmi = 0;
  final int weight;
  final int height;

  String calcBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return 'normal';
    } else
      return 'enderweight';
  }

  String getinfo() {
    if (_bmi >= 25) {
      return 'your fat';
    } else if (_bmi > 18.5) {
      return 'your good';
    } else
      return 'your fking skeleton';
  }

  Color rg() {
    if (_bmi >= 25) {
      return Colors.red;
    } else if (_bmi > 18.5) {
      return Colors.green;
    } else
      return Colors.red;
  }
}

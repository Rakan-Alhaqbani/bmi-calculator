import 'package:bmi_calc/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calc/CalcBrain.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/A': (context) => InputPage(),
      },
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        colorScheme: ColorScheme.dark(primary: Color(0xFF0A0E21)),
      ),
      home: InputPage(),
    );
  }
}

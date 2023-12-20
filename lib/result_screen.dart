import 'package:bmi_calc/constants.dart';
import 'package:bmi_calc/reuseable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.bmiResult,
      required this.result,
      required this.info,
      required this.flash});
  final String bmiResult;
  final String result;
  final String info;
  final Color flash;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('BMI CALC')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.bottomLeft,
              margin: EdgeInsets.all(25),
              child: Text(
                'Your result',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            )),
            Expanded(
                flex: 5,
                child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        result,
                        style: TextStyle(
                            color: flash,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                      Text(
                        bmiResult,
                        style: TextStyle(
                            fontSize: 100, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        info,
                        style: TextStyle(fontSize: 22),
                      )
                    ],
                  ),
                  colour: activeCardColor,
                )),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Center(
                  child: Text(
                    'reCaluclate',
                    style: LargeButton,
                  ),
                ),
                margin: EdgeInsets.only(top: 10),
                width: double.infinity,
                height: bottomContainerHeight,
                color: redColor,
              ),
            )
          ],
        ));
  }
}

import 'dart:ffi';

import 'package:bmi_calc/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reuseable_card.dart';
import 'constants.dart';
import 'package:bmi_calc/CalcBrain.dart';

enum genderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  genderType? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 23;

  //solution for gender active or not

  // Color maleCardColor = inactiveCardColor;
  //Color femaleCardColor = inactiveCardColor;

  //void updateColor(genderType selectedGender) {
  // if (selectedGender == genderType.male) {
  //   if (maleCardColor == inactiveCardColor) {
  //     maleCardColor = activeCardColor;
  //     femaleCardColor = inactiveCardColor;
  //   } else {
  //     maleCardColor = inactiveCardColor;
  //   }
  // }
  // if (selectedGender == genderType.female) {
  //   if (femaleCardColor == inactiveCardColor) {
  //     femaleCardColor = activeCardColor;
  //     maleCardColor = inactiveCardColor;
  //   } else {
  //     femaleCardColor = inactiveCardColor;
  //   }
  // }

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = genderType.male;
                        });
                      },
                      colour: selectedGender == genderType.male
                          ? activeCardColor
                          : inactiveCardColor,
                      cardChild: IconContent(
                        iconh: Icon(
                          FontAwesomeIcons.mars,
                          size: 80,
                        ),
                        label: 'MALE',
                      ),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = genderType.female;
                        });
                      },
                      cardChild: IconContent(
                        iconh: Icon(
                          FontAwesomeIcons.venus,
                          size: 80,
                        ),
                        label: 'FEMALE',
                      ),
                      colour: selectedGender == genderType.female
                          ? activeCardColor
                          : inactiveCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: labelStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: values,
                        ),
                        Text(
                          'cm',
                          style: labelStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
                colour: activeCardColor,
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            colour: activeCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'WEIGHT',
                                  style: labelStyle,
                                ),
                                Text(
                                  weight.toString(),
                                  style: values,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                      ficon: FontAwesomeIcons.minus,
                                      onPreesed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RoundIconButton(
                                      onPreesed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      ficon: FontAwesomeIcons.plus,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: ReusableCard(
                            colour: activeCardColor,
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'AGE',
                                  style: labelStyle,
                                ),
                                Text(
                                  age.toString(),
                                  style: values,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundIconButton(
                                        ficon: FontAwesomeIcons.minus,
                                        onPreesed: () {
                                          setState(() {
                                            age--;
                                          });
                                        }),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    RoundIconButton(
                                        ficon: FontAwesomeIcons.plus,
                                        onPreesed: () {
                                          setState(() {
                                            age++;
                                          });
                                        })
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                CalcBrain calc = CalcBrain(weight: weight, height: height);

                //Navigator.pushNamed(context, '/first');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(
                              bmiResult: calc.calcBMI(),
                              result: calc.getResult(),
                              info: calc.getinfo(),
                              flash: calc.rg(),
                            )));
              },
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Center(
                  child: Text(
                    'Caluclate',
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

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.ficon, required this.onPreesed});
  final IconData? ficon;
  int weight = 80;
  final VoidCallback onPreesed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(ficon),
      onPressed: onPreesed,
      elevation: 6,
      constraints: BoxConstraints.tightFor(width: 56, height: 56),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}

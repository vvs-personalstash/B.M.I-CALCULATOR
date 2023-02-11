import 'package:flutter/material.dart';
import 'package:bmi__calculator/components/reusable_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi__calculator/components/card_widget.dart';
import 'package:bmi__calculator/components/constants.dart';
import 'result_page.dart';
import 'package:bmi__calculator/components/bottom_button.dart';
import 'package:bmi__calculator/components/roundicon_button.dart';
import 'package:bmi__calculator/bmi_brain.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

enum gender {
  male,
  female,
}

class _InputPageState extends State<InputPage> {
  gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                      colour: selectedGender == gender.male
                          ? activecolourofwidget
                          : inactivecolourofwidget,
                      cardChild: MyWidget(
                        cardwidget: FontAwesomeIcons.mars,
                        label: 'Male',
                      ),
                      onpress: () {
                        setState(() {
                          selectedGender = gender.male;
                        });
                      }),
                ),
                Expanded(
                    child: ReusableCard(
                  cardChild: MyWidget(
                    cardwidget: FontAwesomeIcons.venus,
                    label: 'Female',
                  ),
                  colour: selectedGender == gender.female
                      ? activecolourofwidget
                      : inactivecolourofwidget,
                  onpress: () {
                    setState(() {
                      selectedGender = gender.female;
                    });
                  },
                )),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: activecolourofwidget,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Height',
                      style: labelstyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: numberstyle,
                        ),
                        Text(
                          'cm',
                          style: labelstyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEBB1555),
                        overlayColor: Color(0x29EBB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newvalue) {
                            setState(() {
                              height = newvalue.round();
                            });
                          }),
                    )
                  ]),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: activecolourofwidget,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: labelstyle,
                        ),
                        Text(
                          weight.toString(),
                          style: numberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                sign: FontAwesomeIcons.plus,
                                onprssed: () {
                                  setState(() {
                                    weight++;
                                  });
                                }),
                            SizedBox(width: 15.0),
                            RoundIconButton(
                                sign: FontAwesomeIcons.minus,
                                onprssed: () {
                                  setState(() {
                                    weight--;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activecolourofwidget,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: labelstyle,
                        ),
                        Text(
                          age.toString(),
                          style: numberstyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                sign: FontAwesomeIcons.plus,
                                onprssed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                            SizedBox(width: 15.0),
                            RoundIconButton(
                                sign: FontAwesomeIcons.minus,
                                onprssed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttontitle: 'Calculate B.M.I',
            onTp: () {
              BMI_BRAIN bmi = BMI_BRAIN(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Result(
                        bmi: bmi.Bmi_Calculate(),
                        bmitext: bmi.BmiText(),
                        bmicomments: bmi.BmiComment());
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

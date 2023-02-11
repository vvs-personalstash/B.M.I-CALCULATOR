import 'package:bmi__calculator/components/constants.dart';
import 'package:bmi__calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import 'package:bmi__calculator/components/bottom_button.dart';

class Result extends StatelessWidget {
  Result({this.bmi, this.bmicomments, this.bmitext});
  final String? bmi;
  final String? bmitext;
  final String? bmicomments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI RESULTS'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Text(
              "Your Result",
              style: titlestyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: activecolourofwidget,
              cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bmitext!.toUpperCase(),
                      style: resultstyle,
                    ),
                    Text(
                      bmi!,
                      style: resultnumberstyle,
                    ),
                    Text(
                      bmicomments!,
                      style: bodytextstyle,
                    ),
                  ]),
            ),
          ),
          BottomButton(
              onTp: () {
                Navigator.pop(context);
              },
              buttontitle: 'Re-Calculate')
        ],
      ),
    );
  }
}

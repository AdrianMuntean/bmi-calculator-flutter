import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:flutter/material.dart';

import '../components/calculate_button.dart';
import '../components/main_card.dart';
import '../constants.dart';

class ResultsPage extends StatelessWidget {
  static const routeName = '/results';

  @override
  Widget build(BuildContext context) {
    final ResultsPageArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child: Text(
                'Your Result',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              alignment: Alignment.bottomCenter,
            ),
          ),
          Expanded(
            flex: 5,
            child: MainContainer(
                color: ACTIVE_CARD_COLOR,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      args.calculator.getResult().toUpperCase(),
                      style: TextStyle(
                          color: Color(0xFF24D876),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      args.calculator.getBMI(),
                      style:
                          TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      args.calculator.getInterpretation(),
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
          ),
          CalculateButton(
            title: 'RE-CALCULATE',
            onTap: () => {Navigator.pop(context)},
          )
        ],
      ),
    );
  }
}

class ResultsPageArguments {
  final BMICalculator calculator;

  ResultsPageArguments({this.calculator});
}

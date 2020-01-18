import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/components/calculate_button.dart';
import 'package:bmi_calculator/components/gender_button.dart';
import 'package:bmi_calculator/components/main_card.dart';
import 'package:bmi_calculator/components/value_increase_decrease_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/pages/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Gender { MALE, FEMALE }

class InputPage extends StatefulWidget {
  static const routeName = '/';

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.MALE;
  int height = 160;
  int weight = 50;
  int age = 20;

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
                  child: MainContainer(
                    onTap: () => setState(() {
                      selectedGender = Gender.MALE;
                    }),
                    color: selectedGender == Gender.MALE
                        ? ACTIVE_CARD_COLOR
                        : INACTIVE_CARD_COLOR,
                    child: GenderButton(
                      text: 'MALE',
                      icon: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: MainContainer(
                    onTap: () => setState(() {
                      selectedGender = Gender.FEMALE;
                    }),
                    color: selectedGender == Gender.FEMALE
                        ? ACTIVE_CARD_COLOR
                        : INACTIVE_CARD_COLOR,
                    child: GenderButton(
                        text: 'FEMALE', icon: FontAwesomeIcons.venus),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: MainContainer(
              color: ACTIVE_CARD_COLOR,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: DESCRIPTION_TEXT_STYLE,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: BIG_NUMBER_TEXT_STYLE,
                      ),
                      Text(
                        'cm',
                        style: DESCRIPTION_TEXT_STYLE,
                      )
                    ],
                  ),
                  SliderTheme(
                    child: Slider(
                      value: this.height.toDouble(),
                      onChanged: (double value) {
                        setState(() {
                          this.height = value.toInt();
                        });
                      },
                      min: 120,
                      max: 210,
                    ),
                    data: SliderThemeData(
                      inactiveTrackColor: Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: MainContainer(
                    color: ACTIVE_CARD_COLOR,
                    child: ValueIncreaseDecreaseCard(
                      label: 'WEIGHT',
                      value: weight,
                      unit: 'kg',
                      onPressIncrease: () => setState(() {
                        weight < 100 ? weight++ : weight;
                      }),
                      onPressDecrease: () => setState(() {
                        weight > 1 ? weight-- : weight;
                      }),
                    ),
                  ),
                ),
                Expanded(
                  child: MainContainer(
                    color: ACTIVE_CARD_COLOR,
                    child: ValueIncreaseDecreaseCard(
                      label: 'AGE',
                      value: age,
                      onPressIncrease: () => setState(() {
                        age < 100 ? age++ : age;
                      }),
                      onPressDecrease: () => setState(() {
                        age > 1 ? age-- : age;
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),
          CalculateButton(
            onTap: () {
              BMICalculator calc =
                  BMICalculator(height: height, weight: weight);

              Navigator.pushNamed(context, ResultsPage.routeName,
                  arguments: ResultsPageArguments(calculator: calc));
            },
          )
        ],
      ),
    );
  }
}

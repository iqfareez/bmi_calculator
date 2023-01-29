import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../Utils/bmi_utils.dart';
import '../providers/bmi_provider.dart';

class InputData extends StatefulWidget {
  const InputData({Key? key}) : super(key: key);

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  final weightController = TextEditingController();

  final heightController = TextEditingController();

  final snackBar = const SnackBar(
    content: Text(
        'Cannot calculate: Input field(s) are empty or contains invalid value(s)'),
    behavior: SnackBarBehavior.floating,
    duration: Duration(seconds: 2),
  );

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(
          height: 23.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                // TODO: Change to textFormField, perhaps boleh handle validation
                child: TextField(
                  controller: weightController,
                  maxLength: 5,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Weight ",
                    counter: Offstage(),
                    hintText: "Eg: 57.2",
                    suffixText: "kg",
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  onEditingComplete: () => node.nextFocus(),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                    controller: heightController,
                    maxLength: 4,
                    decoration: const InputDecoration(
                      counter: Offstage(),
                      border: OutlineInputBorder(),
                      labelText: "Height",
                      hintText: "Eg: 1.73",
                      suffixText: "m",
                    ),
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (_) => node.unfocus()),
              ),
            )
          ],
        ),
        const SizedBox(height: 20.0),
        Consumer<BmiProvider>(
          builder: (_, value, __) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Spacer(),
              // const SizedBox(width: 20.0),
              // buildResetButton(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.red,
                        side: const BorderSide(color: Colors.red)),
                    onPressed: () {
                      node.unfocus();
                      if (weightController.text.isEmpty &&
                          heightController.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Nothing to clear");
                        return;
                      }
                      weightController.clear();
                      heightController.clear();
                      value.bmiValue = 0.0; // clear value
                      Fluttertoast.showToast(
                        msg: "Cleared",
                        toastLength: Toast.LENGTH_SHORT,
                        backgroundColor: Colors.orange.shade700,
                        textColor: Colors.white,
                      );
                    },
                    child: const Text('Reset')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.green,
                        side: const BorderSide(color: Colors.green)),
                    onPressed: () {
                      node.unfocus();

                      try {
                        double heightValue =
                            double.parse(heightController.text);
                        double weightValue =
                            double.parse(weightController.text);
                        double bmiResult =
                            BmiUtils.calculateBmi(heightValue, weightValue);
                        value.bmiValue = bmiResult;
                      } catch (e) {
                        ScaffoldMessenger.of(context).removeCurrentSnackBar();
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const Text('Calculate')),
              ),
              // const SizedBox(width: 20.0),
              const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}

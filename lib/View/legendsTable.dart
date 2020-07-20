import 'package:flutter/material.dart';

class LegendsTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: RichText(
              text: TextSpan(
                  text: 'Legends:\n',
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                    TextSpan(
                      text: '• Less than',
                    ),
                    TextSpan(
                        text: ' 16.0 - ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'Severely Underweight\n',
                    ),
                    TextSpan(
                      text: '• From',
                    ),
                    TextSpan(
                        text: ' 16.0 to 18.5 - ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'Underweight\n',
                    ),
                    TextSpan(
                      text: '• From',
                    ),
                    TextSpan(
                        text: ' 18.6 to 25.0 - ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'Normal Weight\n',
                    ),
                    TextSpan(
                      text: '• From',
                    ),
                    TextSpan(
                        text: ' 25.1 to 30.0 - ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'Overweight\n',
                    ),
                    TextSpan(
                      text: '• From',
                    ),
                    TextSpan(
                        text: ' 30.1 to 35.0 - ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'Moderately Obese\n',
                    ),
                    TextSpan(
                      text: '• More than',
                    ),
                    TextSpan(
                        text: ' 35.0 - ',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text: 'Severely Obese\n',
                    ),
                  ]),
            ),
          ),
        )
      ],
    );
  }
}

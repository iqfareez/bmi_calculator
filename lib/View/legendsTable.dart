import 'package:bmicalculator/Utils/bmiLegends.dart';
import 'package:flutter/material.dart';

//Responsible for showing table in main.dart
const kRangeTextStyle = TextStyle(fontWeight: FontWeight.bold);

class LegendsDataTable extends StatelessWidget {
  final BmiLegends bmiLegends = BmiLegends();
  static double? bmiValue;
  @override
  Widget build(BuildContext context) {
    return DataTable(
      sortAscending: true,
      sortColumnIndex: 0,
      headingRowHeight: 36,
      dataRowHeight: 25,
      columns: [
        DataColumn(label: Text('Range')),
        DataColumn(label: Text('Description')),
      ],
      rows: [
        buildDataRow('< 16.0', 'Severely Underweight',
            0 == bmiLegends.getIndex(bmiValue)),
        buildDataRow(
            '16.0 - 18.5', 'Underweight', 1 == bmiLegends.getIndex(bmiValue)),
        buildDataRow(
            '18.6 - 25.0', 'Normal weight', 2 == bmiLegends.getIndex(bmiValue)),
        buildDataRow(
            '25.1 - 30.0', 'Overweight', 3 == bmiLegends.getIndex(bmiValue)),
        buildDataRow('30.1 - 35.0', 'Moderately obese',
            4 == bmiLegends.getIndex(bmiValue)),
        buildDataRow(
            '> 35.0', 'Severly obese', 5 == bmiLegends.getIndex(bmiValue))
      ],
    );
  }

  DataRow buildDataRow(String range, String description, bool isSelected) {
    return DataRow(selected: isSelected, cells: [
      DataCell(Text(
        range,
        style: kRangeTextStyle,
      )),
      DataCell(Text(description))
    ]);
  }
}

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

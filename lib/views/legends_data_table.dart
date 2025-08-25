import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../shared/enums/bmi_enums.dart';
import '../providers/bmi_provider.dart';

class LegendsDataTable extends StatelessWidget {
  const LegendsDataTable({super.key});
  static double? bmiValue;

  String buildRangeString(double? min, double? max) {
    if (min == null) {
      return '> $max';
    }
    if (max == null) {
      return '< $min';
    }
    return '${min.toStringAsFixed(1)} - ${max.toStringAsFixed(1)}';
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BmiProvider>(
      builder: (context, value, child) => DataTable(
        headingRowHeight: 36,
        dataRowHeight: 25,
        columns: const [
          DataColumn(
              label: Align(
            child: Text('Range (kg)'),
          )),
          DataColumn(label: Text('Description')),
        ],
        rows: BmiEnums.values
            .map((e) => DataRow(
                  selected: value.bmiEnum == e,
                  cells: [
                    DataCell(Text(
                      buildRangeString(e.min, e.max),
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                    DataCell(Text(e.description))
                  ],
                ))
            .toList(),
      ),
    );
  }
}

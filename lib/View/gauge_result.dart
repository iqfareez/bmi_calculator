import 'package:bmicalculator/providers/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'bmi_gauge.dart';

class GaugeResult extends StatelessWidget implements PreferredSizeWidget {
  const GaugeResult({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BmiProvider>(
      builder: (_, value, __) => SizedBox(
        height: 190,
        width: 190,
        child: BmiGauge(
          bmiValue: value.bmiValue,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(200.0);
}

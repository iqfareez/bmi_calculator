import 'package:flutter/material.dart';

import '../shared/enums/bmi_enums.dart';

class BmiProvider extends ChangeNotifier {
  double _bmiValue = 0;
  BmiEnums? _bmiEnum;

  set bmiValue(double value) {
    _bmiValue = value;
    _bmiEnum = _getEnum(value);
    notifyListeners();
  }

  double get bmiValue => _bmiValue;

  BmiEnums get bmiEnum => _bmiEnum ?? BmiEnums.severlyUnderweight;

  BmiEnums _getEnum(double bmiValue) {
    for (var i = 0; i < BmiEnums.values.length; i++) {
      // if min is null, set it to a low value
      // if max is null, set it to a high value
      if (bmiValue >= (BmiEnums.values[i].min ?? 0) &&
          bmiValue <= (BmiEnums.values[i].max ?? 100)) {
        return BmiEnums.values[i];
      }
    }
    // if (bmiValue < 16.0) {
    //   return BmiEnums.severlyUnderweight;
    // }
    // if (bmiValue >= 16 && bmiValue < 18.5) {
    //   return BmiEnums.underweight;
    // }
    // if (bmiValue >= 18.5 && bmiValue < 25.0) {
    //   return BmiEnums.normal;
    // }
    // if (bmiValue >= 25.0 && bmiValue < 30) {
    //   return BmiEnums.overweight;
    // }
    // if (bmiValue >= 30 && bmiValue < 35) {
    //   return BmiEnums.moderatelyObese;
    // }
    // // if bmiValue is over 35
    return BmiEnums.severlyUnderweight;
  }
}

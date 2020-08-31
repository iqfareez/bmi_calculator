class BmiLegends {
  List<String> _legendsText = [
    "Severly underweight",
    "Underweight",
    "Normal Weight",
    "Overweight",
    "Moderately Obese",
    "Severly obese"
  ];

  String getLegends(double value) {
    if (value < 16)
      return _legendsText[0];
    else if (value >= 16 && value < 18.5)
      return _legendsText[1];
    else if (value >= 18.5 && value < 25.0)
      return _legendsText[2];
    else if (value >= 25.0 && value < 30)
      return _legendsText[3];
    else if (value >= 30 && value < 35)
      return _legendsText[4];
    else if (value >= 35)
      return _legendsText[5];
    else
      return "Err";
  }
}

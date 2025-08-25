enum BmiEnums {
  severlyUnderweight("Serverly Underweight", null, 16),
  underweight("Underweight", 16, 18.5),
  normal("Normal", 18.5, 25),
  overweight("Overweight", 25, 30),
  moderatelyObese("Moderately Obese", 30, 35),
  severelyObese(
      "Severely Obese", 35, null); // max value is jus a very large value

  const BmiEnums(this.description, this.min, this.max);
  final String description;
  final double? min;
  final double? max;
}

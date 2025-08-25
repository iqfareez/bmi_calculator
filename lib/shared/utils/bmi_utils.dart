class BmiUtils {
  /// a function that takes weight and height and return BMI value
  static double calculateBmi(double height, double weight) {
    return weight / (height * height);
  }
}

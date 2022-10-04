import 'package:flutter/material.dart';

class BmiNotifier extends ChangeNotifier {
  bmiCalculate(
    double height, double weight, var heightUnits, var weightUnits) {
    if (heightUnits == "mts" && weightUnits == "kg") {
      double bmiValue = weight / (height * height);
      return bmiValue;
    }
    else if (heightUnits == "cm" && weightUnits == "kg") {
      height = height/100;
      double bmiValue = weight / (height * height);
      return bmiValue;
    }
    else if (heightUnits == "mts" && weightUnits == "g") {
      weight = weight/1000;
      double bmiValue = weight / (height * height);
      return bmiValue;
    }
    else if (heightUnits == "cm" && weightUnits == "g") {
      height = height/100;
      weight = weight/1000;
      double bmiValue = weight / (height * height);
      return bmiValue;
    }
  }
}

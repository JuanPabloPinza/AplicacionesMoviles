import 'dart:math';

class CalculosMate {
  static double calcular(String value) {
    switch (value) {
      case 'pi':
        return acos(-1);
      case 'e':
        return exp(1);
      default:
        return 0.0;
    }
  }
}

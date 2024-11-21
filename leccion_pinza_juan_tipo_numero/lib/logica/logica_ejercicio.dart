class NumberChecker {
  static String getNumberType(int number) {
    if (number > 0) {
      return "Número ingresado positivo";
    } else if (number < 0) {
      return "Número ingresado negativo.";
    } else {
      return "Número ingresado nulo.";
    }
  }
}

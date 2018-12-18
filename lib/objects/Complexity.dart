class Complexity {

  static List<String> TSHIRTS = ['UNKNOWN', 'XS', 'S', 'M', 'L', 'XL'];

  int value;

  Complexity.fromTShirts(String size) {
    if(TSHIRTS.contains(size)) {
      value = TSHIRTS.indexOf(size);
    } else {
      // Fallback
      value = 0;
    }
  }

  String get level => TSHIRTS[value];
}
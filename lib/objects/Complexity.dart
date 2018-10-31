class Complexity {

  static List<String> TSHIRTS = ['UNKNOWN', 'XS', 'S', 'M', 'L', 'XL'];

  int _value;

  Complexity.fromTShirts(String size) {
    if(TSHIRTS.contains(size)) {
      _value = TSHIRTS.indexOf(size);
    } else {
      // Fallback
      _value = 0;
    }
  }

  String get level => TSHIRTS[_value];
}
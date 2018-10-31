class Priority {

  static List<String> LEVELS =
      ['UNKNOWN', 'lowest', 'low', 'medium', 'high', 'highest'];

  int _value;

  Priority.fromLevels(String level) {
    if(LEVELS.contains(level)) {
      _value = LEVELS.indexOf(level);
    } else {
      // Fallback
      _value = 0;
    }
  }

  String get level => LEVELS[_value];
}
class Priority {

  static List<String> LEVELS =
      ['UNKNOWN', 'lowest', 'low', 'medium', 'high', 'highest'];

  int value;

  Priority.fromLevels(String level) {
    if(LEVELS.contains(level)) {
      value = LEVELS.indexOf(level);
    } else {
      // Fallback
      value = 0;
    }
  }

  String get level => LEVELS[value];
}
enum Day { monday, tuesday, wednesday, thurthday, friday, none }

extension DayExtention on Day {
  String get ja {
    switch (this) {
      case Day.monday:
        return "月";
      case Day.tuesday:
        return "火";
      case Day.wednesday:
        return "水";
      case Day.thurthday:
        return "木";
      case Day.friday:
        return "金";
      case Day.none:
        return "なし";
    }
  }

  int compareTo(Day other) => index.compareTo(other.index);

  bool isNone() => this == Day.none;
}

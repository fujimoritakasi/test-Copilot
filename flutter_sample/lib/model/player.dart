import './day.dart';

class Player {
  final String name;
  final List<Day> holidays;

  Player(this.name, this.holidays);

  Player toggleHoliday(Day targetDay) {
    if (holidays.contains(targetDay)) {
      // this.holidays内に、targetDayが含まれている場合、this.holidaysから該当の日付を削除
      // holidays.where((day) => day == targetDay);
      var updateddHolidays = holidays.where((day) => day != targetDay).toList();
      return Player(name, updateddHolidays);
    } else {
      // this.holidays内に、targetDayが含まれていない場合、this.holidaysへ該当の日付を追加
      var updateddHolidays = [...holidays];
      updateddHolidays.add(targetDay);
      return Player(name, updateddHolidays);
    }
  }

  String damenahiString() {
    String string = "ダメな日:";

    if (holidays.isEmpty) {
      return string + " なし";
    }

    holidays.forEach((day) {
      string = string + " " + day.ja;
    });

    return string;
  }
}

import 'package:flutter_sample/model/amida_result.dart';
import 'package:flutter_sample/model/day.dart';
import 'package:flutter_sample/model/duty.dart';
import 'package:flutter_sample/model/player.dart';
import 'package:flutter_sample/model/players.dart';

class Amidakuji {
  final Players players;

  Amidakuji(this.players);

  AmidaResult executeAmidakuji() {
    var days = [
      Day.monday,
      Day.tuesday,
      Day.wednesday,
      Day.thurthday,
      Day.friday
    ];

    List<Duty> duties = [];

    days.shuffle();
    Players shuffledPlayers = players.shuffle();

    // holidayがある人だけのリストを作成
    List<Player> haveHolidayPlayers = shuffledPlayers.players
        .where((player) => player.holidays.length != 0)
        .toList();

    for (var player in haveHolidayPlayers) {
      var loopCounter = 0;
      const limitLoopCounterValue = 30;

      while (player.holidays.contains(days[0]) &&
          loopCounter != limitLoopCounterValue) {
        days.shuffle();
        loopCounter = loopCounter + 1;
      }

      if (loopCounter == limitLoopCounterValue) {
        print("あみだくじ失敗");
        return AmidaResult([], true);
      } else {
        duties.add(Duty(player, days[0]));
        days.removeAt(0);
      }
    }

    // holidayが無い人だけのリストを作成
    List<Player> notHaveHolidayPlayers = shuffledPlayers.players
        .where((player) => player.holidays.isEmpty)
        .toList();
    for (var player in notHaveHolidayPlayers) {
      if (days.isEmpty) {
        duties.add(Duty(player, Day.none));
        continue;
      }
      days.shuffle();
      duties.add(Duty(player, days[0]));
      days.removeAt(0);
    }

    // 月➞金の順でソート
    duties.sort((a, next) => a.dutyDay.compareTo(next.dutyDay));

    return AmidaResult(duties, false);
  }
}

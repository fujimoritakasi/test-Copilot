import 'dart:io';

import 'package:flutter_sample/model/amida_result.dart';
import 'package:flutter_sample/model/amidakuji.dart';
import 'package:flutter_sample/model/players.dart';

import '../model/day.dart';
import '../model/duty.dart';
import '../model/player.dart';

class AmidaResultService {
  Future<AmidaResult> executeAmidakuji(Players players) {
    AmidaResult amidaResult = Amidakuji(players).executeAmidakuji();

    if (amidaResult.isFailed) {
      throw Exception("エラーが発生しました");
    }

    return Future.delayed(Duration(seconds: 1)).then((value) => amidaResult);
  }
}

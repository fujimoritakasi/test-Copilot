import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/model/players.dart';

import '../../model/player.dart';

class PlayersCubit extends Cubit<Players> {
  PlayersCubit() : super(Players([])) {
    _loadPlayersFromJson();
  }

  /// JSONファイルからプレイヤーリストを読み込む
  Future<void> _loadPlayersFromJson() async {
    try {
      final String response =
          await rootBundle.loadString('assets/player/players.json');
      final data = json.decode(response);

      List<Player> players =
          (data['players'] as List).map((name) => Player(name, [])).toList();
      emit(Players(players));
    } catch (e) {
      print('Failed to load players from JSON: $e');
    }
  }

  void addNewPlayer(name) => emit(state.addNewPlayer(name));

  void deletePlayer(name) => emit(state.deletePlayer(name));

  void updateHolidayOfPlayer(name, day) =>
      emit(state.updatePlayerHoliday(name, day));
}

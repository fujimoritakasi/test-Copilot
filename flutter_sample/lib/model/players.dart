import 'package:flutter_sample/model/player.dart';

import 'day.dart';

class Players {
  final List<Player> players;

  Players(this.players);

  Players updatePlayerHoliday(String name, Day holiday) {
    List<Player> newPlayers = players.map((player) {
      if (player.name == name) {
        return player.toggleHoliday(holiday);
      }
      return player;
    }).toList();
    return Players(newPlayers);
  }

  Players addNewPlayer(String name) {
    if (players.where((e) => e.name == name).isNotEmpty) {
      return this;
    }
    if (name == "") {
      return this;
    }
    List<Player> clonePlayers = [...players];
    clonePlayers.add(Player(name, []));
    return Players(clonePlayers);
  }

  Players deletePlayer(String name) {
    return Players(players.where((e) => e.name != name).toList());
  }

  Players shuffle() {
    List<Player> clonePlayers = [...players];
    clonePlayers.shuffle();
    return Players(clonePlayers);
  }
}

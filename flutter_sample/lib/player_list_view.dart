import 'package:flutter/cupertino.dart';
import 'package:flutter_sample/model/players.dart';
import 'package:flutter_sample/player_form.dart';

import 'input_area.dart';

class PlayerListView extends StatelessWidget {
  final Players players;

  const PlayerListView(this.players);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...players.players.map((player) => InputAreaWidget(player)).toList(),
        const PlayerForm()
      ],
    );
  }
}

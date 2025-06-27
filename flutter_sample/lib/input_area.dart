import 'package:flutter/material.dart';
import 'package:flutter_sample/model/player.dart';
import 'package:flutter_sample/model/players.dart';
import 'package:flutter_sample/text_field.dart';

import 'day_button.dart';
import 'delete_user_button.dart';

class InputAreaWidget extends StatelessWidget {
  final Player player;

  InputAreaWidget(this.player);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DeleteUserButtonWidget(player),
        Container(
          child: Text(
            player.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          width: 100,
        ),
        DayButtonsWidget(player),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/cubit/players_cubit.dart';
import 'package:flutter_sample/model/player.dart';

import 'model/day.dart';

class DayButtonWidget extends StatelessWidget {
  final Day day;

  final Player player;

  final bool selected;

  const DayButtonWidget(this.day, this.player, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        margin: const EdgeInsets.all(10),
        child: ElevatedButton(
          onPressed:
              // TODO キュービットを呼び出し
              () => context
                  .read<PlayersCubit>()
                  .updateHolidayOfPlayer(player.name, day),
          child: Text(day.ja),
          style: ElevatedButton.styleFrom(
              backgroundColor: selected ? Colors.blue : Colors.grey),
        ));
  }
}

class DayButtonsWidget extends StatelessWidget {
  final Player player;

  DayButtonsWidget(this.player);

  final days = [
    Day.monday,
    Day.tuesday,
    Day.wednesday,
    Day.thurthday,
    Day.friday
  ];

  bool isSelected(Day day) {
    return !player.holidays.contains(day);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        ...days
            .map((day) => DayButtonWidget(day, player, isSelected(day)))
            .toList()
      ],
    ));
  }
}

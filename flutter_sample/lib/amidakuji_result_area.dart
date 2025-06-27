import 'package:flutter/material.dart';
import 'package:flutter_sample/bloc/bloc/states/amida_result_state.dart';
import 'package:flutter_sample/model/duty.dart';

import 'model/day.dart';

class AmidakujiResultAreaWidget extends StatelessWidget {
  final AmidaResultState state;

  const AmidakujiResultAreaWidget(this.state);

  @override
  Widget build(BuildContext context) {
    if (state is AmidaResultInitialState) {
      return Container();
    } else if (state is AmidaResultLoadingState) {
      return const CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
      );
    } else if (state is AmidaResultLoadedState) {
      return Column(
        children: [
          ...(state as AmidaResultLoadedState)
              .amidaResult
              .dutyList
              .map((duty) => DutyView(duty))
              .toList()
        ],
      );
    } else if (state is AmidaResultErrorState) {
      return const Text("エラーが発生しました😇",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red));
    }
    return Container();
  }
}

class DutyView extends StatelessWidget {
  final Duty duty;
  const DutyView(this.duty, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 100,
          child: Text(
            duty.dutyDay.isNone() ? "回避！" : duty.dutyDay.ja + "曜日",
            style: const TextStyle(fontSize: 24),
          ),
        ),
        SizedBox(
          width: 150,
          child: Text(
            duty.player.name,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          width: 150,
          child: Text(duty.player.damenahiString()),
        )
      ],
    );
  }
}

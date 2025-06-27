import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/bloc/amida_result_bloc.dart';
import 'package:flutter_sample/bloc/bloc/events/execute_amida_event.dart';
import 'package:flutter_sample/bloc/cubit/players_cubit.dart';

import 'model/players.dart';

class ExecuteAmidakujiButtonWidget extends StatelessWidget {
  const ExecuteAmidakujiButtonWidget({Key? key}) : super(key: key);

  void _executeAmida(BuildContext context) {
    // Players players = context.read<PlayersCubit>().state;
    Players players = context.read<PlayersCubit>().state;
    context.read<AmidaResultBloc>().add(ExecuteAmidaEvent(players));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () => _executeAmida(context),
        child: const Text("あみだくじを引く"),
      ),
    );
  }
}

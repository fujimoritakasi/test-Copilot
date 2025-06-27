import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/cubit/players_cubit.dart';
import 'package:flutter_sample/model/player.dart';
import 'package:flutter_sample/player_list_view.dart';

class DeleteUserButtonWidget extends StatelessWidget {
  final Player player;

  DeleteUserButtonWidget(this.player);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
        child: IconButton(
          onPressed: () =>
              context.read<PlayersCubit>().deletePlayer(player.name),
          icon: Icon(Icons.clear),
        ));
  }
}

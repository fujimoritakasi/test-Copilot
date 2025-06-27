import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/cubit/players_cubit.dart';

class PlayerForm extends StatelessWidget {
  const PlayerForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _contorller = TextEditingController();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          child: TextFormField(
            controller: _contorller,
            decoration: InputDecoration(labelText: "player name"),
          ),
        ),
        ElevatedButton(
          onPressed: () =>
              context.read<PlayersCubit>().addNewPlayer(_contorller.text),
          child: const Text("追加"),
        )
      ],
    );
  }
}

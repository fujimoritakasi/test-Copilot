import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/bloc/amida_result_bloc.dart';
import 'package:flutter_sample/bloc/bloc/states/amida_result_state.dart';
import 'package:flutter_sample/bloc/cubit/players_cubit.dart';
import 'package:flutter_sample/bloc/observer/custom_cloc_observer.dart';
import 'package:flutter_sample/player_list_view.dart';
import 'package:flutter_sample/service/amida_result_service.dart';

import 'amidakuji_result_area.dart';
import 'execute_amidakuji_button.dart';
import 'model/players.dart';

void main() {
  BlocOverrides.runZoned(() {
    runApp(const MyApp());
  }, blocObserver: CustomBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'あみだくじアプリ'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => PlayersCubit()),
            BlocProvider(create: (_) => AmidaResultBloc(AmidaResultService())),
          ],
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.all(20),
                  child: const Text(
                    "プレイヤーを選択してください",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                BlocBuilder<PlayersCubit, Players>(
                  builder: (context, players) => PlayerListView(players),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: const ExecuteAmidakujiButtonWidget(),
                ),
                Container(
                    margin: const EdgeInsets.all(20),
                    child: BlocBuilder<AmidaResultBloc, AmidaResultState>(
                        builder: (context, amidaResultStete) =>
                            AmidakujiResultAreaWidget(amidaResultStete)))
              ],
            ),
          ),
        ));
  }
}

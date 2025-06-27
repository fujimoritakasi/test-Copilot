import 'package:flutter_sample/model/amida_result.dart';

abstract class AmidaResultState {}

class AmidaResultInitialState extends AmidaResultState {}

class AmidaResultLoadingState extends AmidaResultState {}

class AmidaResultLoadedState extends AmidaResultState {
  final AmidaResult amidaResult;

  AmidaResultLoadedState(this.amidaResult);

  @override
  List<Object?> get props => [amidaResult];
}

class AmidaResultErrorState extends AmidaResultState {}

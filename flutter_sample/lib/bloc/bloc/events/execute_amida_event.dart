import 'package:flutter_sample/bloc/bloc/events/amida_event.dart';
import 'package:flutter_sample/model/players.dart';

class ExecuteAmidaEvent extends AmidaEvent {
  final Players players;

  ExecuteAmidaEvent(this.players);
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/bloc/bloc/events/amida_event.dart';
import 'package:flutter_sample/bloc/bloc/events/execute_amida_event.dart';
import 'package:flutter_sample/bloc/bloc/states/amida_result_state.dart';
import 'package:flutter_sample/model/amida_result.dart';
import 'package:flutter_sample/service/amida_result_service.dart';

class AmidaResultBloc extends Bloc<AmidaEvent, AmidaResultState> {
  final AmidaResultService amidaResultService;

  AmidaResultBloc(this.amidaResultService) : super(AmidaResultInitialState()) {
    on<ExecuteAmidaEvent>((event, emit) async {
      // ローディング状態をセット
      emit(AmidaResultLoadingState());
      try {
        // 非同期であみだくじの結果を待つ
        AmidaResult result =
            await amidaResultService.executeAmidakuji(event.players);
        emit(AmidaResultLoadedState(result));
      } catch (e) {
        emit(AmidaResultErrorState());
      }
    });
  }
}

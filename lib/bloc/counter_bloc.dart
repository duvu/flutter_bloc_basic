import 'package:bloc/bloc.dart';
import 'package:bloc_tutorial1/event/data_event.dart';
import 'package:bloc_tutorial1/state/data_state.dart';

class CounterBloc extends Bloc<DataEvent, DataState> {
  int count = 0;

  CounterBloc() : super(Success(count: 0));

  @override
  DataState get initialState => Success(count: 0);

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if (event is IncreaseEvent) {
      yield Loading();
      await Future.delayed(const Duration(seconds: 1));
      count = count + 1;
      yield Success(count: count);
    }
  }
}

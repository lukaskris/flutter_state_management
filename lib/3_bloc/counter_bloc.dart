import 'dart:async';

import 'package:learn_redux/util/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';
class CounterBloc extends BlocBase{

  final _counter = new BehaviorSubject<int>.seeded(0);
  final _addCounterController = StreamController();

  CounterBloc(){
    _addCounterController.stream.listen((data) =>
        _counter.sink.add(_counter.value+1)
    );
  }

  ValueObservable<int> get counter => _counter.stream;

  StreamSink get addCounter => _addCounterController.sink;

  @override
  void dispose() {
    _counter.close();
    _addCounterController.close();
  }

}
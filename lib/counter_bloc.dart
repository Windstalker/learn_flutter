import 'dart:async';
import 'package:learn_flutter/counter_event.dart';

class CounterBloc {
  int _counter = 0;

  final _counterStreamController = StreamController<int>();
  StreamSink<int> get _inCounter => _counterStreamController.sink;
  Stream<int> get counter => _counterStreamController.stream;

  final _counterEventController = StreamController<CounterEvent>();
  Sink<CounterEvent> get counterEventSink => _counterEventController.sink;

  CounterBloc() {
    _counterEventController.stream.listen(_mapEventsToState);
  }

  void _mapEventsToState(CounterEvent event) {
    if (event is IncrementEvent) _counter++;
    if (event is DecrementEvent) _counter--;

    _inCounter.add(_counter);
  }
}

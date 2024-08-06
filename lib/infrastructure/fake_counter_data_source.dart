import 'dart:async';

import 'package:counter_with_onion_architecture/core/domain/model/counter.dart';
import 'package:counter_with_onion_architecture/infrastructure/counter_data_source.dart';

class FakeCounterDataSource implements CounterDataSource {
  FakeCounterDataSource() {
    _controller.add(_counter);
  }

  Counter _counter = const Counter(0);
  final StreamController<Counter> _controller = StreamController<Counter>();

  @override
  Stream<Counter> watch() {
    return _controller.stream;
  }

  @override
  Future<void> saveCounter(Counter counter) async {
    await Future<void>.delayed(Duration.zero);
    _counter = counter;
    _controller.add(_counter);
  }
}

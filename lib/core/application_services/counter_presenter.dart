import 'dart:async';

import 'package:counter_with_onion_architecture/core/domain/model/counter.dart';
import 'package:counter_with_onion_architecture/core/domain/services/increment_counter.dart';

/// Application Services Layer
class CounterPresenter {
  CounterPresenter(this.incrementCounter) {
    incrementCounter.counterStream.listen(_updateCounter);
  }

  final IncrementCounter incrementCounter;
  Counter? _counter;
  final StreamController<Counter> _controller = StreamController<Counter>();

  Stream<Counter> get counterStream => _controller.stream;

  void increment() {
    if (_counter != null) {
      incrementCounter.increment(_counter!);
    }
  }

  void _updateCounter(Counter counter) {
    _counter = counter;
    _controller.add(_counter!);
  }

  void dispose() => _controller.close();
}

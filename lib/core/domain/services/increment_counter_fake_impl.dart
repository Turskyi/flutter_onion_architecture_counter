import 'dart:async';

import 'package:counter_with_onion_architecture/core/domain/model/counter.dart';
import 'package:counter_with_onion_architecture/core/domain/services/increment_counter.dart';
import 'package:counter_with_onion_architecture/infrastructure/counter_data_source.dart';

class IncrementCounterFakeImpl implements IncrementCounter {
  IncrementCounterFakeImpl(this.dataSource) {
    _init();
  }

  final CounterDataSource dataSource;
  final StreamController<Counter> _controller = StreamController<Counter>();

  Future<void> _init() async {
    dataSource.watch().listen((Counter counter) {
      _controller.add(counter);
    });
  }

  @override
  void increment(Counter counter) async {
    final Counter newCounter = counter.copyWith(value: counter.value + 1);
    await dataSource.saveCounter(newCounter);
  }

  @override
  Stream<Counter> get counterStream => _controller.stream;
}

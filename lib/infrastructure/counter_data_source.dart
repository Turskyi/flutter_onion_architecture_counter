// Infrastructure Component
import 'package:counter_with_onion_architecture/core/domain/model/counter.dart';

// Infrastructure Component
abstract interface class CounterDataSource {
  const CounterDataSource();

  Stream<Counter> watch();

  Future<void> saveCounter(Counter counter);
}

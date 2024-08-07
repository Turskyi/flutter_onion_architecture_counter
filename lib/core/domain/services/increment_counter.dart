import 'package:counter_with_onion_architecture/core/domain/model/counter.dart';

// Domain Services Layer
abstract interface class IncrementCounter {
  const IncrementCounter();

  void increment(Counter counter);

  Stream<Counter> get counterStream;
}

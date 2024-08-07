import 'package:async/async.dart';
import 'package:counter_with_onion_architecture/core/application_services/counter_presenter.dart';
import 'package:counter_with_onion_architecture/core/domain/model/counter.dart';
import 'package:counter_with_onion_architecture/core/domain/services/increment_counter.dart';
import 'package:counter_with_onion_architecture/core/domain/services/increment_counter_fake_impl.dart';
import 'package:counter_with_onion_architecture/infrastructure/counter_data_source.dart';
import 'package:counter_with_onion_architecture/infrastructure/fake_counter_data_source.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CounterPresenter should update the counter', () async {
    final CounterDataSource dataSource = FakeCounterDataSource();
    final IncrementCounter incrementCounter = IncrementCounterFakeImpl(
      dataSource,
    );
    final CounterPresenter presenter = CounterPresenter(incrementCounter);

    final StreamQueue<Counter> queue = StreamQueue<Counter>(
      presenter.counterStream,
    );

    final Counter initialCounter = await queue.next;
    expect(initialCounter.value, 0);

    presenter.increment();
    final Counter newCounter = await queue.next;
    expect(newCounter.value, 1);

    await queue.cancel();
  });
}

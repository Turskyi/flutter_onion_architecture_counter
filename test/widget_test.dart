import 'package:counter_with_onion_architecture/core/application_services/counter_presenter.dart';
import 'package:counter_with_onion_architecture/core/domain/services/increment_counter.dart';
import 'package:counter_with_onion_architecture/core/domain/services/increment_counter_fake_impl.dart';
import 'package:counter_with_onion_architecture/infrastructure/fake_counter_data_source.dart';
import 'package:counter_with_onion_architecture/user_interface/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    final FakeCounterDataSource dataSource = FakeCounterDataSource();
    final IncrementCounter incrementCounter = IncrementCounterFakeImpl(
      dataSource,
    );
    final CounterPresenter presenter = CounterPresenter(incrementCounter);
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp(presenter: presenter));

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

import 'package:counter_with_onion_architecture/core/application_services/counter_presenter.dart';
import 'package:counter_with_onion_architecture/core/domain/services/increment_counter.dart';
import 'package:counter_with_onion_architecture/core/domain/services/increment_counter_fake_impl.dart';
import 'package:counter_with_onion_architecture/infrastructure/fake_counter_data_source.dart';
import 'package:counter_with_onion_architecture/user_interface/my_app.dart';
import 'package:flutter/material.dart';

/// The [main] function represents the ultimate detail — the lowest-level policy
/// in the system.
/// It serves as the initial entry point of the application, and nothing, other
/// than the operating system, depends on it.
/// In the [main] function, dependencies are injected and configurations are
/// set up.
/// This makes [main] a low-level module located in the outermost circle of the
/// onion architecture.
/// Think of [main] as a plugin to the application — a module that gathers all
/// external resources, sets initial conditions, and hands control over to the
/// high-level policy represented by [MyApp].
/// Changes to [main] do not affect any other component in the system, as they
/// are decoupled from it and remain unaffected by its modifications.
void main() {
  final FakeCounterDataSource dataSource = FakeCounterDataSource();
  final IncrementCounter incrementCounter = IncrementCounterFakeImpl(
    dataSource,
  );
  final CounterPresenter presenter = CounterPresenter(incrementCounter);
  runApp(MyApp(presenter: presenter));
}

import 'package:counter_with_onion_architecture/core/application_services/counter_presenter.dart';
import 'package:counter_with_onion_architecture/core/domain/services/increment_counter.dart';
import 'package:counter_with_onion_architecture/core/domain/services/increment_counter_fake_impl.dart';
import 'package:counter_with_onion_architecture/infrastructure/fake_counter_data_source.dart';
import 'package:counter_with_onion_architecture/user_interface/my_home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FakeCounterDataSource dataSource = FakeCounterDataSource();
    final IncrementCounter incrementCounter =
        IncrementCounterFakeImpl(dataSource);
    final CounterPresenter presenter = CounterPresenter(incrementCounter);

    return MaterialApp(
      title: 'Flutter Onion Architecture Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
      ),
      home: MyHomePage(
        title: 'Onion Architecture Demo Home Page',
        presenter: presenter,
      ),
    );
  }
}

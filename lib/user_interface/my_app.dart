import 'package:counter_with_onion_architecture/core/application_services/counter_presenter.dart';
import 'package:counter_with_onion_architecture/user_interface/my_home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({required this.presenter, super.key});

  final CounterPresenter presenter;

  @override
  Widget build(BuildContext context) {
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

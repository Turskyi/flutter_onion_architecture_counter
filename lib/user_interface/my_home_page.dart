import 'package:counter_with_onion_architecture/core/application_services/counter_presenter.dart';
import 'package:counter_with_onion_architecture/core/domain/model/counter.dart';
import 'package:flutter/material.dart';

// User Interface Component
class MyHomePage extends StatefulWidget {
  const MyHomePage({
    required this.title,
    required this.presenter,
    super.key,
  });

  final String title;
  final CounterPresenter presenter;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<Counter>(
              stream: widget.presenter.counterStream,
              initialData: const Counter(0),
              builder: (BuildContext context, AsyncSnapshot<Counter> snapshot) {
                return Text(
                  '${snapshot.data?.value ?? 0}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: widget.presenter.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    widget.presenter.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

import 'package:rxdart/rxdart.dart';

class RxDartApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RxDartExamplePage(),
    );
  }
}

class RxDartExamplePage extends StatelessWidget {
  RxDartExamplePage({Key? key}) : super(key: key);

  final _relay = CounterRelay();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("RxDart编写计数器"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder<int>(
              stream: _relay.stream,
              builder: (context, snapshot) {
                return Text(
                  _relay.stream.value.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _relay.increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterRelay {
  final _subject = BehaviorSubject.seeded(0);

  ValueStream<int> get stream => _subject.stream;

  void increment() {
    _subject.add(_subject.value + 1);
  }

  void dispose() {
    _subject.close();
  }
}

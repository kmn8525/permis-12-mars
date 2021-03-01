import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(context) {
    return StreamBuilder<void>(
        stream: Stream.periodic(Duration(seconds: 3)),
        builder: (context, snapshot) {
          print('rebuilding MaterialApp');
          return MaterialApp(
              theme: ThemeData(
                textTheme: TextTheme(
                    body1: TextStyle(fontSize: 40)
                ),
              ),
              home: Scaffold(
                  body: Center(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('Stateless 😩'), MyStatelessWidget()],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('Stateful 👌'), MyStatefulWidget()],
                            ),
                          ),
                        ]
                    ),
                  )
              )
          );
        }
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
        future: Future.value(DateTime.now().second),
        builder: (context, snapshot) => Text(snapshot.data.toString())
    );
  }
}


class MyStatefulWidget extends StatefulWidget {
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {

  Future<int> _future;

  @override
  void initState() {
    super.initState();
    _future = Future.value(DateTime.now().second);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<int>(
        future: _future,
        builder: (context, snapshot) => Text(snapshot.data.toString())
    );
  }
}
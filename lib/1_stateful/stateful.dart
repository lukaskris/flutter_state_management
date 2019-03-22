import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StatefulPage extends StatelessWidget{

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState){
        return new Scaffold(
            appBar: new AppBar(
              title: new Text('Example Stateful'),
            ),
            body:  Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => setState((){ _counter++; }),
              tooltip: 'Increment',
              child: Icon(Icons.add),
            )
        );
      },
    );
  }

}
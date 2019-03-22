import 'package:flutter/material.dart';
import 'package:learn_redux/2_scope_model/counter_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopedModelPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final model = ScopedModel.of<CounterModel>(context, rebuildOnChange: true);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Example ScopedModel'),
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '${model.counter}',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => model.increment(),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        )
    );
  }
}
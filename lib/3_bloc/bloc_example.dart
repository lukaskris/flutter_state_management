import 'package:flutter/material.dart';
import 'package:learn_redux/3_bloc/counter_bloc.dart';
import 'package:learn_redux/util/bloc_provider.dart';

class BlocExamplePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<CounterBloc>(context);
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Example BLoC'),
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
              StreamBuilder<int>(
                stream: bloc.counter,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.display1,
                  );
                }
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            bloc.addCounter.add(null);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        )
    );
  }

}
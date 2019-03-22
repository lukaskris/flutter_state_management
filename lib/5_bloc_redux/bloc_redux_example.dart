import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_redux/5_bloc_redux/core/store_provider.dart';
import 'package:learn_redux/5_bloc_redux/store.dart';

class BlocReduxExample extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: CounterStore(),
      child: new Scaffold(
          appBar: new AppBar(
            title: new Text('Example Bloc Redux'),
          ),
          body: CounterWidget(),
          floatingActionButton: AddButton()
      ),
    );
  }

}

class CounterWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<CounterStore>(context);
    final counter = store.state.output.counter;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'You have pushed the button this many times:',
          ),
          StreamBuilder<int>(
            stream: counter.stream,
            builder: (context, snapshot) {
              return Text(
                '${snapshot.data}',
                style: Theme.of(context).textTheme.display1,
              );
            }
          ),
        ],
      ),
    );
  }
}
class AddButton extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<CounterStore>(context);
    return  FloatingActionButton(
      onPressed: (){
        store.dispatch(CounterActionIncrement());
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }

}
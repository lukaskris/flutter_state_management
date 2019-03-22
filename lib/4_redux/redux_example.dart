import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learn_redux/4_redux/app_state.dart';
import 'package:learn_redux/4_redux/reducers.dart';
import 'package:redux/redux.dart';
class ReduxExamplePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      converter: (store) => _ViewModel.create(store),
      builder: (context, _ViewModel viewModel) => new Scaffold(
          appBar: new AppBar(
            title: new Text('Example Redux'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${viewModel.count}',
                  style: Theme.of(context).textTheme.display1,
                )
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => viewModel.increment(),
            tooltip: 'Increment',
            child: Icon(Icons.add),
          )
      ),
    );
  }

}

class _ViewModel{
  final Function() increment;
  final int count;
  _ViewModel({this.count, this.increment});

  factory _ViewModel.create(Store<AppState> store) {
    _onIncrement(){
      store.dispatch(Actions.Increment);
    }

    return _ViewModel(
      count: store.state.count,
      increment: _onIncrement
    );
  }
}
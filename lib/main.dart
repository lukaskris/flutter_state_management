import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learn_redux/1_stateful/stateful.dart';
import 'package:learn_redux/2_scope_model/counter_model.dart';
import 'package:learn_redux/2_scope_model/scope_model.dart';
import 'package:learn_redux/3_bloc/bloc_example.dart';
import 'package:learn_redux/3_bloc/counter_bloc.dart';
import 'package:learn_redux/4_redux/app_state.dart';
import 'package:learn_redux/4_redux/redux_example.dart';
import 'package:learn_redux/5_bloc_redux/bloc_redux_example.dart';
import 'package:learn_redux/util/bloc_provider.dart';
import 'package:redux/redux.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:learn_redux/4_redux/reducers.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Store store = Store<AppState>(
        appStateReducer,
        initialState: AppState.initialState()
    );
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'State Management Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'State Management Flutter'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
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
            new RaisedButton(onPressed: () => _showStateful(), child: new Text('Stateful')),
            new RaisedButton(onPressed: () => _showScopedModel(), child: new Text('Scoped Model')),
            new RaisedButton(onPressed: () => _showBloc(), child: new Text('BLoC')),
            new RaisedButton(onPressed: () => _showRedux(), child: new Text('Redux')),
            new RaisedButton(onPressed: () => _showBlocRedux(), child: new Text('BLoC Redux')),
          ],
        ),
      )
    );
  }

  _showStateful() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => StatefulPage()));
  _showScopedModel() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => new ScopedModel<CounterModel>(model: CounterModel(), child: ScopedModelPage())));
  _showBloc() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => new BlocProvider<CounterBloc>(bloc: CounterBloc(), child: BlocExamplePage())));
  _showRedux() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => new ReduxExamplePage()));
  _showBlocRedux() => Navigator.of(context).push(MaterialPageRoute(builder: (context) => new BlocReduxExample()));
}

import 'package:learn_redux/4_redux/app_state.dart';

enum Actions{Increment}

int incrementReducer(int state, action){
  if(action == Actions.Increment) return state + 1;
  return state;
}

AppState appStateReducer(AppState state, action){
  return AppState(count: incrementReducer(state.count, action));
}

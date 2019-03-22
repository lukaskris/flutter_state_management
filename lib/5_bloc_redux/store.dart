

import 'package:learn_redux/5_bloc_redux/core/blox_redux.dart';
import 'package:rxdart/rxdart.dart';

class CounterActionIncrement extends BRAction<int>{}

class CounterStateInput extends BRStateInput{
  final BehaviorSubject<int> counter = BehaviorSubject();

  @override
  void dispose() {
    counter.close();
  }
}

class CounterStateOutput extends BRStateOutput{
  StreamWithInitialData<int> counter;
  CounterStateOutput(CounterStateInput input){
    counter = StreamWithInitialData(input.counter.stream, input.counter.value);
  }
}

class CounterState extends BRState<CounterStateInput, CounterStateOutput>{
  CounterState(){
    input = CounterStateInput();
    input.counter.add(0);
    output = CounterStateOutput(input);
  }
}

// Blocs
Bloc<CounterStateInput> counterIncrementHandler = (action, input){
  if(action is CounterActionIncrement){
    input.counter.add(input.counter.value + 1);
  }
};

// Store
class CounterStore extends BRStore<CounterStateInput, CounterState>{
  CounterStore(){
    state = CounterState();
    blocs = [counterIncrementHandler];
  }
}
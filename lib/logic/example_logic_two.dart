import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorBloc extends Bloc<Color, Color>{
  ColorBloc(initialState) : super(initialState);

  Color get initialState => Colors.red;

  Stream<Color> mapEventToState(Color color) async* {
    yield selector(color);
  }

  Color selector(Color color){
    return color==Colors.red?Colors.blue:Colors.red;
  }
  
}

class ColorCubit extends Cubit<Color>{
  ColorCubit() : super(Colors.red);

  /*метод используемый виджетом */
  void selectColor()=>emit(selector(state));

  Color selector(Color color){
    return color==Colors.red?Colors.blue:Colors.red;
  }

  @override
  void onChange(Change<Color> change) {
    
    super.onChange(change);
  }
  
}

class ColorObserver extends BlocObserver{

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition $transition ');
  }

  
}


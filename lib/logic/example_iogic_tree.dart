import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorState{
  final Color color;
  const ColorState(this.color);
}


class ColorEvent {
  final int index;
  const ColorEvent(this.index);
}

class ColorBloc extends Bloc<ColorEvent, ColorState> {
  ColorBloc() : super(const ColorState(Colors.red)){
    //обязательная регистрация обработчика событий через "on"
    on<ColorEvent>((ColorEvent event, Emitter<ColorState> emit){
         emit(ColorState(selectorColor(event.index)));
    });
    // on<OtherEvent>((OtherEvent event, Emitter<OtherState> emit){
    //      emit(OtherState(selectorOther(event.index)));
    // });
    
  }


  Color selectorColor(int i){
    if(i%2==0){
      return Colors.green;
    }else if(i%3==0) {
      return Colors.blue;
    }else if(i%5==0){
      return Colors.yellow;
    }else{
      return Colors.red;
    }
   
}

}
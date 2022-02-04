
import 'dart:async';

import 'package:flutter/material.dart';


class ColorBackground{

/*Здесь. Цвет по умолчанию */
   Color _color = Colors.green;

    /*контроллер потока в который будем
    отправлять события из представления*/
   final StreamController<Color> _inEventController=StreamController<Color>();
   /*геттер с объектом синк для отправки в поток
   событий из представления */
   StreamSink<Color> get inEventSink => _inEventController.sink;

   /*контроллер потока из которого
   будем получать измененное состояние в предствлении*/
   final StreamController<Color> _outEventController=StreamController<Color>();

   /*геттер с объектом стрим для получения в представлении
   измененных состояний из потока*/
   Stream<Color> get outStateStream => _outEventController.stream;

   /*просто получаем цвет. Метод вспомогательный
   именно для этого кода, так как контроллер потока, получающего
   события из предсталения, получает цвет  */
   Color get color =>_color;

   /*метод переключающий цвета */
   void _mapColor(Color color){
     if(color==Colors.green){
       _color = Colors.red;
     }else{
       _color = Colors.green;
     }
     /*после чего полученый цвет отдаем в поток
     из которого данные получает представление*/
     _outEventController.sink.add(_color);
   }

   ColorBackground(){
     _inEventController.stream.listen(_mapColor);
   }

/*отписываемся от потоков */
   void dispose(){
     _inEventController.close();
     _outEventController.close();
   }

}



import 'package:examples/logic/example_iogic_tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocExample extends StatelessWidget {
  const BlocExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return _View();
  }
}

class BlocView extends StatelessWidget {
  const BlocView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ColorBloc(),

      child:  _View(),
      lazy: false,
    );
    
  }

  Widget value(BuildContext context){
    return BlocProvider.value(
      value: BlocProvider.of<ColorBloc>(context),
      child: _View(),
      );
  }
}

// ignore: must_be_immutable
class _View extends StatefulWidget{
  int index = 0;
  ColorBloc bloc = ColorBloc();
  @override
  State<StatefulWidget> createState() =>_ViewState();
  
}

class _ViewState extends State<_View> {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<ColorBloc, ColorState>(
      builder: builder,
      bloc: widget.bloc,
      buildWhen: (previous, state){
        return true;
      },
    ));
  }

  Widget builder(BuildContext context, ColorState s) {
    return GestureDetector(
      child: Container(
        width: 200,
        height: 200,
        color: s.color,
      ),
      onTap: () {
        /*по нажатию на кнопку, передаем эвент в блок */
        widget.bloc.add(ColorEvent(++widget.index));
        
      },
    );
  }

}
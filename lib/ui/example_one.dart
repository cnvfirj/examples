import 'package:examples/logic/example_logic_one.dart';
import 'package:flutter/material.dart';



class WidgetExample extends StatefulWidget {
  const WidgetExample({Key? key}) : super(key: key);

  @override
  State createState() => StateWidgetExample();
}

class StateWidgetExample extends State<WidgetExample> {
  final ColorBackground _bloc = ColorBackground();
  @override
  Widget build(BuildContext context) {
    return Center(
        child: StreamBuilder(
            stream: _bloc.outStateStream,
            initialData: _bloc.color,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return GestureDetector(
                onTap: () {
                  _bloc.inEventSink.add(_bloc.color);
                },
                child: Container(
                  width: 200,
                  height: 200,
                  color: snapshot.data,
                ),
              );
            }));
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

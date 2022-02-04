import 'package:examples/ui/example_tree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/example_logic_two.dart';

void main() {

  BlocOverrides.runZoned(
      () => runApp(const MyApp()),
      blocObserver: ColorObserver(),
    );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: const BlocExample(),),
    );
  }
}



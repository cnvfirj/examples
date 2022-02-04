import 'package:examples/logic/example_logic_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitExample extends StatelessWidget {
  const CubitExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const CubitView();
  }
}

class CubitView extends StatelessWidget {
  const CubitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ColorCubit(),
      child: const View(),
    );
  }
}

class View extends StatelessWidget {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: BlocBuilder<ColorCubit, Color>(
      builder: builder,
    ));
  }

  Widget builder(BuildContext c, Color s) {
    return GestureDetector(
      child: Container(
        width: 200,
        height: 200,
        color: s,
      ),
      onTap: () {
        c.read<ColorCubit>().selectColor();
      },
    );
  }
}

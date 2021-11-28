import 'package:airport/common/models/bloc.dart';
import 'package:flutter/material.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key? key, required this.bloc, required this.child})
      : super(key: key);

  static T of<T extends Bloc>(BuildContext context) {
    BlocProvider<T>? blocProvider = context.findAncestorWidgetOfExactType();
    return blocProvider!.bloc;
  }

  @override
  State<StatefulWidget> createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider<Bloc>> {
  @override
  Widget build(BuildContext context) {
    widget.bloc.init();
    return widget.child;
  }

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
}

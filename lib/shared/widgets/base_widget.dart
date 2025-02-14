import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {

  final Widget Function(BuildContext context, T provider, Widget? child) builder;
  final T provider;
  final Widget? child;

  const BaseWidget({super.key, required this.builder, required this.provider, this.child});

  @override
  State<BaseWidget<T>> createState() => _BaseWidgetState<T>();
}

class _BaseWidgetState<T extends ChangeNotifier> extends State<BaseWidget<T>> {

  late T _provider;

  @override
  void initState() {
    _provider = widget.provider;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: _provider,
      child: Consumer(
          builder: widget.builder,
        child: widget.child,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'kernel.dart';

class Graph extends StatelessWidget {
  final Widget child;
  final GraphKernel kernel;

  Graph({required this.kernel, Key? key, Widget? child})
      : this.child = child ?? Container(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: kernel,
      child: this.child,
    );
  }
}

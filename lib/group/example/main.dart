import 'package:grapher/kernel/kernel.dart';
import 'package:grapher/group/example/factory.dart';

import '../tag.dart';
import 'tag-tester.dart';

import 'package:flutter/material.dart';
import '/pointer/widget.dart';

main(List<String> args) async {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final graph = createGraph();
    return MaterialApp(
      theme: getThemeData(),
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GraphPointer(kernel: graph),
            )
          ],
        ),
      ),
    );
  }

  ThemeData getThemeData() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.blueGrey,
    );
  }

  GraphKernel createGraph() {
    return GraphKernel(
        child: GroupFactory(
            child: TagUsingGroupID(prefix: 'tag_test', child: TagTester())));
  }
}

import 'package:grapher/kernel/object.dart';
import 'package:grapher/kernel/propagator/endline.dart';

class ReferenceTester extends GraphObject with EndlinePropagator {
  void test() {
    print("the test function was called");
  }
}

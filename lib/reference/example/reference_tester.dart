import 'package:grapher/kernel/object.dart';
import 'package:grapher/kernel/propagator/endline.dart';
import 'package:grapher/reference/reader.dart';

class ReferenceTester extends GraphObject with EndlinePropagator {
  final ReferenceReader<ReferenceTester> referenceToSelf;
  ReferenceTester({required this.referenceToSelf}) {
    Future.delayed(const Duration(milliseconds: 2), () {
      final self = referenceToSelf.read();
      self!.test();
    });
  }

  void test() {
    print("the test function was called");
  }
}

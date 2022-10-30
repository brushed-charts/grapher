import 'package:grapher/filter/incoming-data.dart';
import 'package:grapher/kernel/object.dart';
import 'package:grapher/kernel/propagator/single.dart';
import 'package:grapher/group/example/group.dart';

class GroupFactory extends GraphObject with SinglePropagator {
  GroupFactory({GraphObject? child}) {
    this.child = child;
    generate(1);
    generate(1);
    generate(1);

    generate(10);
    generate(10);
  }

  void generate(int id) {
    final group = Group(id);
    propagate(IncomingData(group));
  }
}

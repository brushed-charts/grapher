import 'package:grapher/kernel/object.dart';
import 'package:grapher/kernel/propagator/single.dart';
import 'package:grapher/reference/contract.dart';

class Reference extends GraphObject with SinglePropagator {
  final ReferenceRepositoryInterface repository;
  final String name;

  Reference(
      {required this.name,
      required this.repository,
      required GraphObject child}) {
    this.child = child;
    repository.link(name, child);
  }
}

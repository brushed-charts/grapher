import 'package:grapher/kernel/object.dart';
import 'package:grapher/kernel/propagator/single.dart';
import 'package:grapher/reference/contract.dart';

class Reference extends GraphObject with SinglePropagator {
  final ReferenceRepositoryInterface _repository;
  final String name;

  Reference(
      {required this.name,
      required ReferenceRepositoryInterface repository,
      required GraphObject child})
      : _repository = repository {
    this.child = child;
    _repository.link(name, child);
  }
}

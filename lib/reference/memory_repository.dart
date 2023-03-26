import 'package:grapher/kernel/object.dart';

import 'contract.dart';

class ReferenceRepositoryInMemory implements ReferenceRepositoryInterface {
  final _repository = <String, GraphObject>{};

  @override
  T? access<T extends GraphObject>(String name) {
    if (!_repository.containsKey(name)) return null;
    return _repository[name] as T;
  }

  @override
  void link(String name, GraphObject reference) {
    if (_repository.containsKey(name)) {
      throw StateError("Reference repository already contains "
          "object named: $name");
    }
    _repository[name] = reference;
  }

  void reset() {
    _repository.clear();
  }
}

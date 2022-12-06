import 'package:grapher/reference/contract.dart';

import '../kernel/object.dart';

class ReferenceReader<T extends GraphObject> {
  final ReferenceRepositoryInterface repository;
  final String refName;
  ReferenceReader({required this.repository, required this.refName});

  T? read() => repository.access<T>(refName);
}

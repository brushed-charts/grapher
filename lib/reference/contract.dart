import 'package:grapher/kernel/object.dart';

abstract class ReferenceRepositoryInterface {
  void link(String name, GraphObject reference);
  T? access<T extends GraphObject>(String name);
}

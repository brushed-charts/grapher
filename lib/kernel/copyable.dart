import 'package:grapher/kernel/object.dart';

abstract class Copyable<T> extends GraphObject {
  T copy();
}

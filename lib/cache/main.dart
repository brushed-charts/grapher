import 'package:grapher/cache/contract.dart';
import 'package:grapher/kernel/object.dart';
import 'package:grapher/kernel/propagator/single.dart';

class CacheChild extends GraphObject with SinglePropagator {
  final CacheContract storage;
  final String key;

  CacheChild({
    required this.storage,
    required this.key,
    required SinglePropagator child,
  }) {
    final initSucceed = initFromCache(child);
    if (initSucceed) return;
    classicInit(child);
  }

  bool initFromCache(SinglePropagator child) {
    final cache = storage.load(key) as SinglePropagator?;
    if (cache == null) return false;
    final subChild = child.child;
    cache.child = subChild;
    this.child = cache as GraphObject;
    return true;
  }

  void classicInit(SinglePropagator child) {
    this.child = child as GraphObject;
    storage.save(key, this.child);
  }
}

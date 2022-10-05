abstract class CacheContract {
  void save(String key, dynamic value);
  dynamic load(String key);
  void remove(String key);
}

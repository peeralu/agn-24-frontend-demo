typedef JsonFactory<T> = T Function(Object? json);

class ModelFactory {
  static final Map<Type, JsonFactory> _factories = {};

  static void register<T>(JsonFactory<T> factory) {
    _factories[T] = factory;
  }

  static T fromJson<T>(Object? json) {
    final factory = _factories[T];
    if (factory == null) {
      throw Exception('No factory registered for type $T');
    }
    return factory(json) as T;
  }

  static List<T> fromJsonList<T>(Object? json) {
    final list = json as List;
    return list.map((e) => fromJson<T>(e)).toList();
  }
}

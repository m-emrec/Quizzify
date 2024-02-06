import 'package:get_it/get_it.dart';

abstract class InjectionContainer {
  final GetIt _sl = GetIt.instance;

  GetIt get sl => _sl;

  /// initialize singletons
  Future<void> initialize();

  /// Dispose singletons
  Future<void> dispose();

  /// Check if the given Object is already registered
  bool isRegistered(instance) => sl.isRegistered(instance: instance);

  /// Unregister the singleton if it is registered.
  void unRegister<T extends Object>(Object? object) {
    final bool registered = isRegistered(object);

    if (registered) sl.unregister<T>(instance: object);
  }

  /// register Singleton if it is not registered.
  void register<T extends Object>(T object) {
    final bool registered = isRegistered(object);

    if (registered == false) sl.registerSingleton<T>(object);
  }
}

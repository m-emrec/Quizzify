import 'package:get_it/get_it.dart';

abstract class InjectionContainer {
  final GetIt _sl = GetIt.instance;
  GetIt get sl => _sl;
  Future<void> initialize();
}

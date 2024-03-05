import '../../../../core/resources/data_state.dart';
import '../../domain/repositories/onboarding_repo.dart';
import '../datasources/onboarding_firestore_connection.dart';

class OnboardingRepoImpl implements OnboardingRepo {
  final OnboardingFirestoreConnection _firestoreConnection;

  OnboardingRepoImpl(
      {required OnboardingFirestoreConnection firestoreConnection})
      : _firestoreConnection = firestoreConnection;
  @override
  Future<DataState> setName(String name) async {
    final DataState dataState =
        await _firestoreConnection.createData({"name": name});
    return dataState;
  }
}

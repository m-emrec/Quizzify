import 'package:trivia/core/resources/data_state.dart';
import 'package:trivia/features/onboarding/data/datasources/onboarding_firestore_connection.dart';
import 'package:trivia/features/onboarding/domain/repositories/onboarding_repo.dart';

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

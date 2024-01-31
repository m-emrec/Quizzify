import 'package:get_it/get_it.dart';
import 'package:trivia/features/auth/data/datasources/auth_firebase_connection.dart';
import 'package:trivia/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:trivia/features/auth/domain/repositories/auth_repo.dart';
import 'package:trivia/features/auth/domain/usecases/forgotPassword_usecase.dart';
import 'package:trivia/features/auth/domain/usecases/signInUserWithEmail_usecase.dart';
import 'package:trivia/features/auth/domain/usecases/signInUserWithFacebook_usecase.dart';
import 'package:trivia/features/auth/domain/usecases/signInUserWithGoogle_usecase.dart';
import 'package:trivia/features/auth/domain/usecases/signup_user_with_email_usecase.dart';
import 'package:trivia/features/auth/presentation/bloc/auth_bloc.dart';

class AuthInjectionContainer {
  final GetIt sl = GetIt.instance;

  Future<void> initialize() async {
    // repo
    sl.registerSingleton<AuthRepo>(AuthRepoImpl(AuthFirebaseConnection()));

    /// use cases
    sl.registerSingleton<ForgotPasswordUsecase>(ForgotPasswordUsecase(sl()));
    sl.registerSingleton<SignInWithEmailUsecase>(SignInWithEmailUsecase(sl()));
    sl.registerSingleton<SignInUserWithFacebook>(SignInUserWithFacebook(sl()));
    sl.registerSingleton<SignInUserWithGoogleUsecase>(
        SignInUserWithGoogleUsecase(sl()));
    sl.registerSingleton<SignUpUserWithEmailUsecase>(
        SignUpUserWithEmailUsecase(sl()));

    /// bloc
    sl.registerSingleton<AuthBloc>(AuthBloc(sl(), sl(), sl(), sl(), sl()));
  }
}

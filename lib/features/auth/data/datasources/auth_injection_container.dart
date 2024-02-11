import 'package:trivia/core/resources/injection_container.dart';
import 'package:trivia/features/auth/data/datasources/auth_firebase_connection.dart';
import 'package:trivia/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:trivia/features/auth/domain/repositories/auth_repo.dart';
import 'package:trivia/features/auth/domain/usecases/forgotPassword_usecase.dart';
import 'package:trivia/features/auth/domain/usecases/signInUserWithEmail_usecase.dart';
import 'package:trivia/features/auth/domain/usecases/signInUserWithFacebook_usecase.dart';
import 'package:trivia/features/auth/domain/usecases/signInUserWithGoogle_usecase.dart';
import 'package:trivia/features/auth/domain/usecases/signup_user_with_email_usecase.dart';
import 'package:trivia/features/auth/presentation/bloc/auth_bloc.dart';

class AuthInjectionContainer extends InjectionContainer {
  @override
  Future<void> initialize() async {
    // repo
    // sl.registerSingleton<AuthRepo>(AuthRepoImpl(AuthFirebaseConnection()));
    register<AuthRepo>(AuthRepoImpl(AuthFirebaseConnection()));

    /// use cases
    // sl.registerSingleton<ForgotPasswordUsecase>(ForgotPasswordUsecase(sl()));
    register<ForgotPasswordUsecase>(ForgotPasswordUsecase(sl()));
    // sl.registerSingleton<SignInWithEmailUsecase>(SignInWithEmailUsecase(sl()));
    register<SignInWithEmailUsecase>(SignInWithEmailUsecase(sl()));
    // sl.registerSingleton<SignInUserWithFacebook>(SignInUserWithFacebook(sl()));
    register<SignInUserWithFacebook>(SignInUserWithFacebook(sl()));
    // sl.registerSingleton<SignInUserWithGoogleUsecase>(
    //     SignInUserWithGoogleUsecase(sl()));
    register<SignInUserWithGoogleUsecase>(SignInUserWithGoogleUsecase(sl()));
    // sl.registerSingleton<SignUpUserWithEmailUsecase>(
    //     SignUpUserWithEmailUsecase(sl()));
    register<SignUpUserWithEmailUsecase>(SignUpUserWithEmailUsecase(sl()));

    /// bloc
    // sl.registerSingleton<AuthBloc>(AuthBloc(sl(), sl(), sl(), sl(), sl()));
    register<AuthBloc>(AuthBloc(sl(), sl(), sl(), sl(), sl()));
  }

  @override
  Future<void> dispose() async {
    unRegister<AuthRepo>(AuthRepo);
    unRegister<ForgotPasswordUsecase>(ForgotPasswordUsecase);
    unRegister<SignInWithEmailUsecase>(SignInWithEmailUsecase);
    unRegister<SignInUserWithFacebook>(SignInUserWithFacebook);
    unRegister<SignInUserWithGoogleUsecase>(SignInUserWithGoogleUsecase);
    unRegister<SignUpUserWithEmailUsecase>(SignUpUserWithEmailUsecase);
    unRegister<AuthBloc>(AuthBloc);
  }
}

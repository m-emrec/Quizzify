import '../../../../core/resources/injection_container.dart';
import 'auth_firebase_connection.dart';
import '../repositories/auth_repo_impl.dart';
import '../../domain/repositories/auth_repo.dart';
import '../../domain/usecases/forgotPassword_usecase.dart';
import '../../domain/usecases/signInUserWithEmail_usecase.dart';
import '../../domain/usecases/signInUserWithFacebook_usecase.dart';
import '../../domain/usecases/signInUserWithGoogle_usecase.dart';
import '../../domain/usecases/signup_user_with_email_usecase.dart';
import '../../presentation/bloc/auth_bloc.dart';

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

import '../bloc/auth_bloc.dart';

mixin AlternativeAuthMethodsMixin {
  final String googleButtonLabel = "Sign in with Google";
  // final String _facebookButtonLabel = "Sign in with Facebook";
  final String or = "OR";

  void signInWithGoogle(AuthBloc authBloc) {
    authBloc.add(AuthSignInWithGoogleEvent());
  }

  void signInWithFacebook(AuthBloc authBloc) {
    authBloc.add(AuthSignInWithFacebookEvent());
  }
}

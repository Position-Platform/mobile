import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:position/src/core/helpers/sharedpreferences.dart';
import 'package:position/src/core/utils/result.dart';
import 'package:position/src/modules/auth/models/user_model/user.dart';
import 'package:position/src/modules/auth/repositories/authRepository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository? authRepository;
  final SharedPreferencesHelper? sharedPreferencesHelper;

  AuthBloc({this.authRepository, this.sharedPreferencesHelper})
      : super(AuthInitial()) {
    on<AuthStarted>(_authStarted);
    on<AuthLoggedIn>(_authLoggedIn);
    on<AuthFirst>(_authFirstOpen);
    on<AuthLoggedOut>(_authLoggedOut);
    on<AuthLogin>(_authLogin);
    on<AuthRegister>(_authRegister);
  }

  //Initialisation du processus d'authentification
  void _authStarted(
    AuthStarted event,
    Emitter<AuthState> emit,
  ) async {
    final isSignedIn = await authRepository!.hastoken();
    final firstOpen = await sharedPreferencesHelper!.getIsFirstOpen();
    final token = await sharedPreferencesHelper!.getToken();

    if (firstOpen) {
      return emit(AuthFirstOpen());
    } else {
      if (isSignedIn) {
        try {
          final userResult = await authRepository!.getuser(token!);
          if (userResult.error is NoInternetError) {
            return emit(AuthNoInternet());
          } else if (userResult.error is ServerError) {
            return emit(AuthFailure());
          } else {
            return emit(AuthSuccess(userResult.success!.data!.user!));
          }
        } catch (e) {
          return emit(AuthServerError());
        }
      } else {
        return emit(AuthFailure());
      }
    }
  }

//Verifier si l'utilisateur est deja connecté
  void _authLoggedIn(
    AuthLoggedIn event,
    Emitter<AuthState> emit,
  ) async {
    final firstOpen = await sharedPreferencesHelper!.getIsFirstOpen();
    final token = await sharedPreferencesHelper!.getToken();
    if (firstOpen) {
      return emit(AuthFirstOpen());
    } else {
      try {
        final userResult = await authRepository!.getuser(token!);
        if (userResult.error is NoInternetError) {
          return emit(AuthNoInternet());
        } else if (userResult.error is ServerError) {
          return emit(AuthServerError());
        } else {
          return emit(AuthSuccess(userResult.success!.data!.user!));
        }
      } catch (e) {
        return emit(AuthServerError());
      }
    }
  }

// première connection de l'utilisateur
  void _authFirstOpen(
    AuthFirst event,
    Emitter<AuthState> emit,
  ) async {
    await sharedPreferencesHelper!.setIsFirstOpen(false);
    return emit(AuthFailure());
  }

// Deconnexion de l'utilisateur
  void _authLoggedOut(
    AuthLoggedOut event,
    Emitter<AuthState> emit,
  ) async {
    final token = await sharedPreferencesHelper!.getToken();
    authRepository!.logout(token!);
    await sharedPreferencesHelper!.deleteToken();
    return emit(AuthFailure());
  }

// Redirection vers la LoginPage
  void _authLogin(
    AuthLogin event,
    Emitter<AuthState> emit,
  ) async {
    return emit(AuthLoginState());
  }

  // Redirection vers la RegisterPage
  void _authRegister(
    AuthRegister event,
    Emitter<AuthState> emit,
  ) async {
    return emit(AuthRegisterState());
  }

  @override
  Future<void> close() {
    return super.close();
  }
}

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:position/src/core/helpers/sharedpreferences.dart';
import 'package:position/src/core/utils/result.dart';
import 'package:position/src/core/utils/validators.dart';
import 'package:position/src/modules/auth/models/auth_model/auth_model.dart';
import 'package:position/src/modules/auth/repositories/authRepository.dart';
import 'package:rxdart/rxdart.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository? authRepository;
  final SharedPreferencesHelper? sharedPreferencesHelper;
  LoginBloc({
    this.authRepository,
    this.sharedPreferencesHelper,
  }) : super(LoginState.initial()) {
    on<LoginIdChanged>(_loginIdChanged,
        transformer: debounce(const Duration(milliseconds: 300)));
    on<LoginPasswordChanged>(_loginPasswordChanged,
        transformer: debounce(const Duration(milliseconds: 300)));
    on<LoginWithCredentialsPressed>(_loginButtonPressed);
    on<PasswordForgot>(_forgotButtonPressed);
    on<PasswordReset>(_resetButtonPressed);
    on<LoginWithFacebookPressed>(_facebookButtonPressed);
    on<LoginWithGooglePressed>(_googleButtonPressed);
    on<LoginPasswordVisibility>(_togglePasswordVisibility);
  }

  // RxDart pour gerer les evenements de facon asynchrone
  EventTransformer<LoginEvent> debounce<LoginEvent>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  // Action de validation d'email qui s'effectue a chaque saisie de l'utilisateur
  void _loginIdChanged(
    LoginIdChanged event,
    Emitter<LoginState> emit,
  ) async {
    if (event.identifiant!.contains('@')) {
      return emit(
          state.update(isIdValid: Validators.isValidEmail(event.identifiant!)));
    } else {
      return emit(state.update(
          isIdValid: Validators.isValidTelephone(event.identifiant!)));
    }
  }

  // Action de validation de mot de passe qui s'effectue a chaque saisie de l'utilisateur
  void _loginPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) async {
    return emit(state.update(
      isPasswordValid: Validators.isValidPassword(event.password!),
    ));
  }

  // Methode qui s'execute lors du clic sur le boutton connexion
  void _loginButtonPressed(
    LoginWithCredentialsPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginState.loading());
    try {
      Result<AuthModel> user = await authRepository!.login(
        event.identifiant!,
        event.password!,
      );
      if (user.success!.success!) {
        await sharedPreferencesHelper!.setToken(user.success!.data!.token!);
        await sharedPreferencesHelper!.setExpireToken();
        return emit(LoginState.success());
      } else {
        return emit(LoginState.failure());
      }
    } catch (e) {
      return emit(LoginState.failure());
    }
  }

  void _forgotButtonPressed(
    PasswordForgot event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginState.loading());
    try {
      await authRepository!.forgotpassword(event.email!);
      return emit(LoginState.send());
    } catch (_) {
      return emit(LoginState.failSend());
    }
  }

  void _resetButtonPressed(
    PasswordReset event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginState.loading());
    try {
      await authRepository!
          .resetpassword(event.email!, event.password!, event.resettoken!);
      return emit(LoginState.resetPassword());
    } catch (_) {
      return emit(LoginState.failedresetPassword());
    }
  }

  void _facebookButtonPressed(
    LoginWithFacebookPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginState.loading());
    try {
      final facebookLogin = FacebookLogin();
      final result = await facebookLogin.logIn(permissions: [
        FacebookPermission.publicProfile,
        FacebookPermission.email,
      ]);

      switch (result.status) {
        case FacebookLoginStatus.success:
          Result<AuthModel> auth =
              await authRepository!.registerfacebook(result.accessToken!.token);
          if (auth.success!.success!) {
            await sharedPreferencesHelper!.setToken(auth.success!.data!.token!);
            await sharedPreferencesHelper!.setExpireToken();
            emit(LoginState.success());
          } else {
            emit(LoginState.failure());
          }
          break;
        case FacebookLoginStatus.cancel:
          emit(LoginState.failure());
          break;
        case FacebookLoginStatus.error:
          emit(LoginState.failure());
          break;
      }
    } catch (error) {
      emit(LoginState.failure());
    }
  }

  void _googleButtonPressed(
    LoginWithGooglePressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginState.loading());
    try {
      var googleLogin = GoogleSignIn(
        scopes: ['email'],
      );

      final result = await googleLogin.signIn();

      if (result != null) {
        final authentication = await result.authentication;

        Result<AuthModel> auth =
            await authRepository!.registergoogle(authentication.accessToken!);
        if (auth.success!.success!) {
          await sharedPreferencesHelper!.setToken(auth.success!.data!.token!);
          await sharedPreferencesHelper!.setExpireToken();
          emit(LoginState.success());
        } else {
          emit(LoginState.failure());
        }
      } else {
        emit(LoginState.failure());
      }
    } catch (e) {
      emit(LoginState.failure());
    }
  }

  void _togglePasswordVisibility(
    LoginPasswordVisibility event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.update(isPasswordVisible: !state.isPasswordVisible!));
  }
}

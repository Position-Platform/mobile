import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return emit(LoginState.success());
      } else {
        return emit(LoginState.failure());
      }
    } catch (_) {
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
}

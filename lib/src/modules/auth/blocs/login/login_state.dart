part of 'login_bloc.dart';

class LoginState extends Equatable {
  final bool? isIdValid;
  final bool? isPasswordValid;
  final bool? isSubmitting;
  final bool? isSuccess;
  final bool? isFailure;
  final bool? isSend;
  final bool? isFailSend;
  final bool? isResetPassword;
  final bool? isFailedResetPassword;

  bool get isFormValid => isIdValid! && isPasswordValid!;

  const LoginState(
      {@required this.isIdValid,
      @required this.isPasswordValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure,
      @required this.isSend,
      @required this.isFailSend,
      @required this.isResetPassword,
      @required this.isFailedResetPassword});

  factory LoginState.initial() {
    return const LoginState(
        isIdValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isSend: false,
        isFailSend: false,
        isResetPassword: false,
        isFailedResetPassword: false);
  }

  factory LoginState.send() {
    return const LoginState(
        isIdValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isSend: true,
        isFailSend: false,
        isResetPassword: false,
        isFailedResetPassword: false);
  }

  factory LoginState.failSend() {
    return const LoginState(
        isIdValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isSend: false,
        isFailSend: true,
        isResetPassword: false,
        isFailedResetPassword: false);
  }

  factory LoginState.loading() {
    return const LoginState(
        isIdValid: true,
        isPasswordValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false,
        isSend: false,
        isFailSend: false,
        isResetPassword: false,
        isFailedResetPassword: false);
  }

  factory LoginState.failure() {
    return const LoginState(
        isIdValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: true,
        isSend: false,
        isFailSend: false,
        isResetPassword: false,
        isFailedResetPassword: false);
  }

  factory LoginState.success() {
    return const LoginState(
        isIdValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: true,
        isFailure: false,
        isSend: false,
        isFailSend: false,
        isResetPassword: false,
        isFailedResetPassword: false);
  }

  factory LoginState.resetPassword() {
    return const LoginState(
        isIdValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isSend: false,
        isFailSend: false,
        isResetPassword: true,
        isFailedResetPassword: false);
  }

  factory LoginState.failedresetPassword() {
    return const LoginState(
        isIdValid: true,
        isPasswordValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isSend: false,
        isFailSend: false,
        isResetPassword: false,
        isFailedResetPassword: true);
  }

  LoginState update({
    bool? isIdValid,
    bool? isPasswordValid,
  }) {
    return copyWith(
        isIdValid: isIdValid,
        isPasswordValid: isPasswordValid,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false,
        isSend: false,
        isFailSend: false,
        isResetPassword: false,
        isFailedResetPassword: false);
  }

  LoginState copyWith(
      {bool? isIdValid,
      bool? isPasswordValid,
      bool? isSubmitEnabled,
      bool? isSubmitting,
      bool? isSuccess,
      bool? isFailure,
      bool? isSend,
      bool? isFailSend,
      bool? isResetPassword,
      bool? isFailedResetPassword}) {
    return LoginState(
        isIdValid: isIdValid ?? this.isIdValid,
        isPasswordValid: isPasswordValid ?? this.isPasswordValid,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure,
        isSend: isSend ?? this.isSend,
        isFailSend: isFailSend ?? this.isFailSend,
        isResetPassword: isResetPassword ?? this.isResetPassword,
        isFailedResetPassword: isFailedResetPassword ?? isFailedResetPassword);
  }

  @override
  String toString() {
    return '''LoginState {
      isIdValid: $isIdValid,
      isPasswordValid: $isPasswordValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      isSend: $isSend,
      isFailSend: $isFailSend,
      isResetPassword : $isResetPassword,
      isFailedResetPassword:$isFailedResetPassword
    }''';
  }

  @override
  List<Object> get props => [
        isIdValid!,
        isPasswordValid!,
        isFailSend!,
        isSubmitting!,
        isSuccess!,
        isFailure!,
        isSend!,
        isResetPassword!,
        isFailedResetPassword!
      ];
}

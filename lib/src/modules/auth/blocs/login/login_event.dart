part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginIdChanged extends LoginEvent {
  final String? identifiant;

  const LoginIdChanged({@required this.identifiant});

  @override
  List<Object> get props => [identifiant!];

  @override
  String toString() => 'LoginIdChanged { identifiant :$identifiant }';
}

class LoginPasswordChanged extends LoginEvent {
  final String? password;

  const LoginPasswordChanged({@required this.password});

  @override
  List<Object> get props => [password!];

  @override
  String toString() => 'LoginPasswordChanged { password: $password }';
}

class PasswordForgot extends LoginEvent {
  final String? email;

  const PasswordForgot({@required this.email});

  @override
  List<Object> get props => [email!];

  @override
  String toString() => 'PasswordReset { email :$email }';
}

class PasswordReset extends LoginEvent {
  final String? email;
  final String? password;
  final String? resettoken;

  const PasswordReset(
      {@required this.email,
      @required this.password,
      @required this.resettoken});

  @override
  List<Object> get props => [email!, password!, resettoken!];

  @override
  String toString() =>
      'PasswordReset { email :$email, password:$password,resettoken:$resettoken }';
}

class LoginWithCredentialsPressed extends LoginEvent {
  final String? identifiant;
  final String? password;

  const LoginWithCredentialsPressed({
    @required this.identifiant,
    @required this.password,
  });

  @override
  List<Object> get props => [identifiant!, password!];

  @override
  String toString() {
    return 'LoginWithCredentialsPressed {identifiant: $identifiant, password: $password }';
  }
}

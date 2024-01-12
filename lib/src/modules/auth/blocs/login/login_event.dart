part of 'login_bloc.dart';

// Classe abstraite de base pour les événements de connexion
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

// Événement de changement d'identifiant de connexion
class LoginIdChanged extends LoginEvent {
  final String? identifiant;

  const LoginIdChanged({@required this.identifiant});

  @override
  List<Object> get props => [identifiant!];

  @override
  String toString() => 'LoginIdChanged { identifiant :$identifiant }';
}

// Événement de changement de mot de passe
class LoginPasswordChanged extends LoginEvent {
  final String? password;

  const LoginPasswordChanged({@required this.password});

  @override
  List<Object> get props => [password!];

  @override
  String toString() => 'LoginPasswordChanged { password: $password }';
}

// Événement de mot de passe oublié
class PasswordForgot extends LoginEvent {
  final String? email;

  const PasswordForgot({@required this.email});

  @override
  List<Object> get props => [email!];

  @override
  String toString() => 'PasswordReset { email :$email }';
}

// Événement de réinitialisation de mot de passe
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

// Événement de connexion avec des identifiants de connexion
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

// Événement de connexion avec Facebook
class LoginWithFacebookPressed extends LoginEvent {}

// Événement de connexion avec Google
class LoginWithGooglePressed extends LoginEvent {}

// Afficher ou masquer le mot de passe
class LoginPasswordVisibility extends LoginEvent {
  final bool? passwordVisibility;

  const LoginPasswordVisibility({@required this.passwordVisibility});

  @override
  List<Object> get props => [passwordVisibility!];

  @override
  String toString() =>
      'LoginPasswordVisibility { passwordVisibility: $passwordVisibility }';
}

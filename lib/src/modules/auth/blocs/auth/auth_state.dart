part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

//authentification reussie
class AuthSuccess extends AuthState {
  final User user;

  const AuthSuccess(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'AuthSuccess { User: $user }';
}

//Etat qui gère la premiere ouverture de l'application
class AuthFirstOpen extends AuthState {}

//Echec d'authentification
class AuthFailure extends AuthState {}

//Authetification Login
class AuthLoginState extends AuthState {}

//Authetification Register
class AuthRegisterState extends AuthState {}

//Pas de Connexion Internet
class AuthNoInternet extends AuthState {}

//Server Error
class AuthServerError extends AuthState {}

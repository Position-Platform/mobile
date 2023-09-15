part of 'auth_bloc.dart';

// Classe abstraite qui définit les événements qui peuvent être déclenchés dans le bloc d'authentification
abstract class AuthEvent extends Equatable {
  const AuthEvent();

  // Méthode qui retourne une liste de propriétés pour comparer les événements
  @override
  List<Object> get props => [];
}

// Classe qui indique que l'application a démarré et que le bloc d'authentification doit être initialisé
class AuthStarted extends AuthEvent {}

// Classe qui indique que l'utilisateur utilise l'application pour la première fois
class AuthFirst extends AuthEvent {}

// Classe qui indique que l'utilisateur s'est connecté avec succès
class AuthLoggedIn extends AuthEvent {}

// Classe qui indique que l'utilisateur s'est déconnecté avec succès
class AuthLoggedOut extends AuthEvent {}

// Classe qui indique que l'utilisateur essaie de se connecter
class AuthLogin extends AuthEvent {}

// Classe qui indique que l'utilisateur essaie de s'inscrire
class AuthRegister extends AuthEvent {}

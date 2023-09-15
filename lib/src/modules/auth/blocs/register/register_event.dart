part of 'register_bloc.dart';

// Classe abstraite qui définit un événement d'inscription
abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  // La méthode `props` est utilisée pour comparer les événements pour l'égalité
  @override
  List<Object> get props => [];
}

// Événement qui est déclenché lorsque l'e-mail est modifié dans le formulaire d'inscription
class RegisterEmailChanged extends RegisterEvent {
  final String? email;

  const RegisterEmailChanged({@required this.email});

  // La méthode `props` est utilisée pour comparer les événements pour l'égalité
  @override
  List<Object> get props => [email!];

  // La méthode `toString` est utilisée pour afficher l'événement dans la console de débogage
  @override
  String toString() => 'RegisterEmailChanged { email :$email }';
}

// Événement qui est déclenché lorsque le mot de passe est modifié dans le formulaire d'inscription
class RegisterPasswordChanged extends RegisterEvent {
  final String? password;

  const RegisterPasswordChanged({@required this.password});

  // La méthode `props` est utilisée pour comparer les événements pour l'égalité
  @override
  List<Object> get props => [password!];

  // La méthode `toString` est utilisée pour afficher l'événement dans la console de débogage
  @override
  String toString() => 'RegisterPasswordChanged { password: $password }';
}

// Événement qui est déclenché lorsque la confirmation du mot de passe est modifiée dans le formulaire d'inscription
class RegisterCPasswordChanged extends RegisterEvent {
  final String? password;
  final String? cpassword;

  const RegisterCPasswordChanged(
      {@required this.password, @required this.cpassword});

  // La méthode `props` est utilisée pour comparer les événements pour l'égalité
  @override
  List<Object> get props => [password!, cpassword!];

  // La méthode `toString` est utilisée pour afficher l'événement dans la console de débogage
  @override
  String toString() =>
      'RegisterPasswordChanged { password: $password, cpassword: $cpassword }';
}

// Événement qui est déclenché lorsque le nom est modifié dans le formulaire d'inscription
class RegisterNameChanged extends RegisterEvent {
  final String? name;

  const RegisterNameChanged({@required this.name});

  // La méthode `props` est utilisée pour comparer les événements pour l'égalité
  @override
  List<Object> get props => [name!];

  // La méthode `toString` est utilisée pour afficher l'événement dans la console de débogage
  @override
  String toString() => 'RegisterPasswordChanged { name: $name }';
}

// Événement qui est déclenché lorsque le numéro de téléphone est modifié dans le formulaire d'inscription
class RegisterPhoneChanged extends RegisterEvent {
  final String? phone;

  const RegisterPhoneChanged({@required this.phone});

  // La méthode `props` est utilisée pour comparer les événements pour l'égalité
  @override
  List<Object> get props => [phone!];

  // La méthode `toString` est utilisée pour afficher l'événement dans la console de débogage
  @override
  String toString() => 'RegisterPhoneChanged { phone: $phone }';
}

// Événement qui est déclenché lorsque le formulaire d'inscription est soumis
class RegisterSubmitted extends RegisterEvent {
  final String? email;
  final String? password;
  final String? name;
  final String? phone;

  const RegisterSubmitted(
      {@required this.email,
      @required this.password,
      @required this.name,
      @required this.phone});

  // La méthode `props` est utilisée pour comparer les événements pour l'égalité
  @override
  List<Object> get props => [email!, password!, name!, phone!];

  // La méthode `toString` est utilisée pour afficher l'événement dans la console de débogage
  @override
  String toString() {
    return 'RegisterSubmitted { email: $email, password: $password , name: $name , phone : $phone  }';
  }
}

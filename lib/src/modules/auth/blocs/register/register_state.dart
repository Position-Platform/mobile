part of 'register_bloc.dart'; // Importe le fichier register_bloc.dart

@immutable
class RegisterState {
  final bool? isEmailValid; // Indique si l'adresse e-mail est valide
  final bool? isPasswordValid; // Indique si le mot de passe est valide
  final bool?
      isCPasswordValid; // Indique si la confirmation du mot de passe est valide
  final bool? isPhoneValid; // Indique si le numéro de téléphone est valide
  final bool?
      isSubmitting; // Indique si le formulaire est en cours de soumission
  final bool? isSuccess; // Indique si la soumission du formulaire a réussi
  final bool? isFailure; // Indique si la soumission du formulaire a échoué

  bool get isFormValid => // Indique si le formulaire est valide
      isEmailValid! && isPasswordValid! && isCPasswordValid! && isPhoneValid!;

  const RegisterState({
    @required this.isEmailValid,
    @required this.isPasswordValid,
    @required this.isCPasswordValid,
    @required this.isPhoneValid,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.isFailure,
  });

  factory RegisterState.initial() {
    // Crée une instance de l'état initial
    return const RegisterState(
      isEmailValid: true,
      isPasswordValid: true,
      isCPasswordValid: true,
      isPhoneValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory RegisterState.loading() {
    // Crée une instance de l'état de chargement
    return const RegisterState(
      isEmailValid: true,
      isPasswordValid: true,
      isCPasswordValid: true,
      isPhoneValid: true,
      isSubmitting: true,
      isSuccess: false,
      isFailure: false,
    );
  }

  factory RegisterState.failure() {
    // Crée une instance de l'état d'échec
    return const RegisterState(
      isEmailValid: true,
      isPasswordValid: true,
      isCPasswordValid: true,
      isPhoneValid: true,
      isSubmitting: false,
      isSuccess: false,
      isFailure: true,
    );
  }

  factory RegisterState.success() {
    // Crée une instance de l'état de réussite
    return const RegisterState(
      isEmailValid: true,
      isPasswordValid: true,
      isCPasswordValid: true,
      isPhoneValid: true,
      isSubmitting: false,
      isSuccess: true,
      isFailure: false,
    );
  }

  RegisterState update({
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isCPasswordValid,
    bool? isPhoneValid,
  }) {
    // Met à jour l'état en fonction des nouvelles valeurs
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isCPasswordValid: isCPasswordValid,
      isPhoneValid: isPhoneValid,
      isSubmitting: false,
      isSuccess: false,
      isFailure: false,
    );
  }

  RegisterState copyWith({
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isCPasswordValid,
    bool? isPhoneValid,
    bool? isSubmitEnabled,
    bool? isSubmitting,
    bool? isSuccess,
    bool? isFailure,
  }) {
    // Crée une nouvelle instance de l'état avec les propriétés spécifiées mises à jour
    return RegisterState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isCPasswordValid: isCPasswordValid ?? this.isCPasswordValid,
      isPhoneValid: isPhoneValid ?? this.isPhoneValid,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      isFailure: isFailure ?? this.isFailure,
    );
  }

  @override
  String toString() {
    // Affiche l'état de l'interface utilisateur dans la console de débogage
    return '''RegisterState {
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isCPasswordValid: $isCPasswordValid,
      isPhoneValid : $isPhoneValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
    }''';
  }
}

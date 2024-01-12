part of 'gps_bloc.dart'; // Importation du fichier gps_bloc.dart

class GpsState extends Equatable {
  // Définition de la classe GpsState qui étend Equatable
  final bool
      isGpsEnabled; // Propriété booléenne qui indique si le GPS est activé
  final bool
      isGpsPermissionGranted; // Propriété booléenne qui indique si la permission GPS est accordée

  bool get isAllGranted =>
      isGpsEnabled &&
      isGpsPermissionGranted; // Propriété booléenne qui indique si le GPS est activé et la permission est accordée

  const GpsState(
      {required this.isGpsEnabled,
      required this.isGpsPermissionGranted}); // Constructeur qui prend deux arguments booléens obligatoires

  GpsState copyWith({
    // Méthode qui renvoie une nouvelle instance de GpsState avec des valeurs mises à jour
    bool? isGpsEnabled,
    bool? isGpsPermissionGranted,
  }) =>
      GpsState(
        isGpsEnabled: isGpsEnabled ?? this.isGpsEnabled,
        isGpsPermissionGranted:
            isGpsPermissionGranted ?? this.isGpsPermissionGranted,
      );

  @override
  List<Object> get props => [
        isGpsEnabled,
        isGpsPermissionGranted
      ]; // Liste des propriétés utilisées pour comparer deux instances de GpsState

  @override
  String toString() =>
      '{isGpsEnabled: $isGpsEnabled, isGpsPermissionGranted: $isGpsPermissionGranted}'; // Chaîne de caractères représentant l'instance de GpsState
}

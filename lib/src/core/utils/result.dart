class Result<T> {
  // Propriété pour stocker le résultat d'une opération réussie
  final T? success;

  // Propriété pour stocker une erreur survenue lors de l'opération
  final Error? error;

  Result({this.success, this.error});
}

class Success<T> extends Result {
  // Propriété pour stocker le résultat d'une opération réussie
  final T? data;

  Success(this.data);
}

class Error extends Result {
  // Propriété pour stocker le message d'erreur
  final String message;

  Error(this.message);
}

// Sous-classes pour les types d'erreurs spécifiques
class NoInternetError extends Error {
  NoInternetError() : super("No internet connection");
}

class ServerError extends Error {
  ServerError() : super("Server error");
}

class UploadError extends Error {
  UploadError() : super("Upload error");
}

class DbInsertError extends Error {
  DbInsertError() : super("Database insert error");
}

class DbGetDataError extends Error {
  DbGetDataError() : super("Database get data error");
}

class DbUpdateError extends Error {
  DbUpdateError() : super("Database update error");
}

class DbDeleteError extends Error {
  DbDeleteError() : super("Database delete error");
}

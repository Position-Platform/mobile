class Result<T> {
  final T? success;

  final Error? error;

  Result({this.success, this.error});
}

class Success<T> extends Result {
  final T? data = null;

  Success(data);
}

class Error extends Result {}

class NoInternetError extends Error {}

class ServerError extends Error {}

class UploadError extends Error {}

class DbInsertError extends Error {}

class DbGetDataError extends Error {}

class DbUpdateError extends Error {}

class DbDeleteError extends Error {}

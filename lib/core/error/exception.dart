class ServerExceptions implements Exception {
  final ErrorMessageModel errorMessageModel;

  @override
  String toString() {
    return 'ServerExceptions{errorMessageModel: $errorMessageModel}';
  }

  const ServerExceptions({required this.errorMessageModel});
}

//for localData ..
class LocalDataBaseException implements Exception {
  final String message;

  LocalDataBaseException(this.message);

  @override
  String toString() {
    return 'LocalDataBaseException{message: $message}';
  }
}

class ErrorMessageModel {
  String error;

  ErrorMessageModel(this.error);

  @override
  String toString() {
    return 'ErrorMessageModel{error: $error}';
  }
}

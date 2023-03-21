class ServerExceptions implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerExceptions({required this.errorMessageModel});
}

//for localData ..
class LocalDataBaseException implements Exception {
  final String message;

  LocalDataBaseException(this.message);
}

class ErrorMessageModel {
  String error = '';

  ErrorMessageModel(this.error);
}

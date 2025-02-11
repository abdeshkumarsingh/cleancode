

class AppException implements Exception{
  final String message;
  final String stackTrace;

  AppException(this.message, this.stackTrace);

  @override
  String toString() {
    return 'AppException{message: $message, stackTrace: $stackTrace}';
  }
}


class NetworkException extends AppException{
  NetworkException(String message, String stackTrace) : super(message, stackTrace);
}

class DatabaseException extends AppException{
  DatabaseException(String message, String stackTrace) : super(message, stackTrace);
}
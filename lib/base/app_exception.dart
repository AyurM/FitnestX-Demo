enum AppExceptionType {
  noConnection('NO_CONNECTION'),
  badGateway('BAD_GATEWAY'),
  timeout('TIMEOUT'),
  validationError('VALIDATION_ERROR'),
  entityNotFound('ENTITY_NOT_FOUND'),
  entityAlreadyExists('ENTITY_ALREADY_EXISTS'),
  incorrectParameters('INCORRECT_PARAMETERS'),
  noAccessRights('NO_ACCESS_RIGHTS'),
  authenticationError('USER_AUTHENTICATION_ERROR'),
  unknownError('UNKNOWN_ERROR');

  final String text;
  const AppExceptionType(this.text);
}

class AppException implements Exception {
  final AppExceptionType errorType;
  final String? message;

  const AppException({required this.errorType, this.message});

  @override
  String toString() => message ?? errorType.text;
}

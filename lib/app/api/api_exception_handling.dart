class BadRequestException implements Exception {
  final String message;
  BadRequestException([this.message = 'Invalid request']);

  @override
  String toString() {
    return message;
  }
}

class InternalServerErrorException implements Exception {
  final String message;
  InternalServerErrorException([this.message = 'Unknown error occurred, please try again later.']);

  @override
  String toString() {
    return message;
  }
}

class ConflictException implements Exception {
  final String message;
  ConflictException([this.message = 'Conflict occurred']);

  @override
  String toString() {
    return message;
  }
}

class UnauthorizedException implements Exception {
  final String message;
  UnauthorizedException([this.message = 'Access denied']);

  @override
  String toString() {
    return message;
  }
}

class NotFoundException implements Exception {
  final String message;
  NotFoundException([this.message = 'The requested information could not be found']);

  @override
  String toString() {
    return message;
  }
}

class NoInternetConnectionException implements Exception {
  final String message;
  NoInternetConnectionException([this.message = 'No internet connection detected, please try again.']);

  @override
  String toString() {
    return message;
  }
}

class DeadlineExceededException implements Exception {
  final String message;
  DeadlineExceededException([this.message = 'The connection has timed out, please try again.']);

  @override
  String toString() {
    return message;
  }
}

class ConnectionClosedException implements Exception {
  final String message;
  ConnectionClosedException([this.message = 'Connection Closed']);

  @override
  String toString() {
    return message;
  }
}
abstract class AccessException implements Exception {
  final String message;
  AccessException(this.message);
}

class UnableToGetQuote extends AccessException {
  UnableToGetQuote(String message) : super(message);
}

class UnableToRequestApi extends AccessException {
  UnableToRequestApi(String message) : super(message);
}

class ServerException implements Exception {}

class CacheException implements Exception {}

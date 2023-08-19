class ServerException implements Exception {
  String error;

  ServerException({this.error = ""});
}

class CacheException implements Exception {
  String error;

  CacheException({this.error = ""});
}

// class PickFileException implements Exception {}

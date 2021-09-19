abstract class Failure {}

class RequiredFailure extends Failure {
  final String message;

  RequiredFailure(this.message);
}

class ServerFailure extends Failure {
  final List<String?> message;

  ServerFailure(this.message);
}

class PermissionFailure extends Failure {
  final String message = "Permission denied.";
}

class FailuresMessages {
  static const String SERVER_CONNECTION_FAILURE =
      "Internal server error";

  static const Map<int, dynamic> HTTP_FAILURES = {
    400: "Bad request",
    401: "Unauthorized",
    403: "Forbidden",
    404: "Not found",
    408: "Request timeout",
  };
}

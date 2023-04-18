class ApiFailure {
  ApiFailure._();

  factory ApiFailure.request({int? code, String? message, dynamic data}) = RequestFailure;

  factory ApiFailure.networkConnection() = NetworkConnectionFailure;

  factory ApiFailure.undefined({Object? error}) = UndefinedFailure;
}

class RequestFailure extends ApiFailure {
  RequestFailure({this.code, this.message, this.data}) : super._();
  final int? code;
  final String? message;
  final dynamic data;
}

class NetworkConnectionFailure extends ApiFailure {
  NetworkConnectionFailure() : super._();
}

class UndefinedFailure extends ApiFailure {
  UndefinedFailure({this.error}) : super._();
  final Object? error;
}

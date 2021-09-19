import 'package:architecture_core/architecture_core.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:architecture_core/core/core.dart';

class HttpService with Listfy {
  final Dio client = Dio();

  HttpService(String route) {

    this.client.options = BaseOptions(
      baseUrl: "${AppSettings.apiPath}$route",
    );
    // this.client.interceptors.add(_AuthInterceptor());
    if (AppSettings.enableLog) _interceptorRegister(_RequestInterceptor());
    AppSettings.interceptors.forEach(_interceptorRegister);
  }

  void _interceptorRegister(Interceptor i) => this.client.interceptors.add(i);

  ServerFailure _errorHandler(Object e) {
    if (e is DioError) {
      DioError err = e;
      return
        ServerFailure(toList<String>(err.response!.data["errors"]));
    }
    return ServerFailure([FailuresMessages.SERVER_CONNECTION_FAILURE]);
  }

  Future<Either<Failure, T>> findByQuery<T>(
      {Map<String, dynamic>? query, required DTO<T> dto}) async {
    try {
      final response = await client.get("", queryParameters: query);
      return Right(dto.toObject(response.data));
    } catch (e) {
      return Left(_errorHandler(e));
    }
  }

  Future<Either<Failure, T>> findById<T>(
      {String path = "", required DTO<T> dto}) async {
    try {
      final response = await client.get(path);
      return Right(dto.toObject(response.data));
    } catch (e) {
      return Left(_errorHandler(e));
    }
  }

  Future<Either<Failure, bool?>> exists({String path = ""}) async {
    try {
      final response = await client.get("/$path");
      return Right(response.data);
    } catch (e) {
      return Left(_errorHandler(e));
    }
  }

  Future<Either<Failure, List<T>>> findAll<T>(
      {String path = "", Map<String, dynamic>? query, required DTO dto}) async {
    try {
      final response = await client.get(path, queryParameters: query);
      return Right(
          toList<Map<String, dynamic>>(response.data)
              .map<T>((Map<String, dynamic> data) => dto.toObject(data))
              .toList());
    } catch (e) {
      return Left(_errorHandler(e));
    }
  }

  Future<Either<Failure, T>> create<T>(Map<String, dynamic> data,
      {String path = "", required DTO<T> dto}) async {
    try {
      final response = await client.post(path, data: data);
      return Right(dto.toObject(response.data));
    } catch (e) {
      return Left(_errorHandler(e));
    }
  }

  Future<Either<Failure, T>> update<T>(Map<String, dynamic> data,
      {String path = "", required DTO<T> dto}) async {
    try {
      final response = await client.patch(path, data: data);
      return Right(dto.toObject(response.data));
    } catch (e) {
      return Left(_errorHandler(e));
    }
  }

  Future<Either<Failure, String?>> delete({String path = ""}) async {
    try {
      final response = await client.delete("/$path");
      return Right(response.data);
    } catch (e) {
      return Left(_errorHandler(e));
    }
  }
}

class _AuthInterceptor extends Interceptor {
  /// Add Bearer token to Authorization Header
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handle) async {
    final GetStorage _storage = GetStorage();
    final token = _storage.read<String>("accessToken");

    if (token != null) {
      options.headers.addAll({"Authorization": "Bearer $token"});
    }

    return handle.next(options);
  }
}

class _RequestInterceptor extends Interceptor {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handle) async {
    print("===REQUEST===");
    print(options.data);
    print(options.path);
    print(options.headers);

    return handle.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("===RESPONSE===");
    print(response.data);
    print(response.realUri);
    print(response.headers);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    print("===ERROR===");
    print(err.response!.statusCode);
    print("${err.requestOptions.baseUrl} -- ${err.requestOptions.uri}");
    print(err.response!.data["errors"]);
    super.onError(err, handler);
  }
}

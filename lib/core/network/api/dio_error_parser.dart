import 'package:clean_code_architecture/core/error/exception.dart';
import 'package:dio/dio.dart';

class DioErrorParser {
  DioErrorParser._();

  static ServerException parseError(DioError error) {
    // need to parse api error like 400, 500
    print(error);
    return ServerException(error.message ?? "Something went wrong");
  }
}

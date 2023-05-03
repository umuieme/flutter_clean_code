import 'package:clean_code_architecture/core/constant/api.dart';
import 'package:dio/dio.dart';

class DioHelper {
  final authorizationKey = "Authorization";
  final Dio dio;

  DioHelper(this.dio) {
    dio.options = BaseOptions(baseUrl: Api.baseUrl);
    print("dio options");
  }

  void addAuthenticationHeader(String token) {
    dio.options.headers[authorizationKey] = token;
  }

  void removeAuthenticationHeader() {
    dio.options.headers.remove(authorizationKey);
  }
}

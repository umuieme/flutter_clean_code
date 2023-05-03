import 'package:clean_code_architecture/core/constant/api.dart';
import 'package:clean_code_architecture/core/network/api/dio_error_parser.dart';
import 'package:clean_code_architecture/features/user_listing/data/models/user_model.dart';
import 'package:dio/dio.dart';

abstract class UserRemoteDataSource {
  Future<List<UserModel>> getUserList();

  Future<UserModel> getUserById();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio dio;

  const UserRemoteDataSourceImpl({required this.dio});

  @override
  Future<UserModel> getUserById() {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<List<UserModel>> getUserList() async {
    try {
      final response = await dio.get(Api.userList);
      return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
    } on DioError catch (error) {
      throw DioErrorParser.parseError(error);
    }
  }
}

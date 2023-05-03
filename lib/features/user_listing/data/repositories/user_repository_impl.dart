import 'package:clean_code_architecture/core/error/exception.dart';
import 'package:clean_code_architecture/core/error/failures.dart';
import 'package:clean_code_architecture/features/user_listing/data/datasources/user_remote_data_source.dart';
import 'package:clean_code_architecture/features/user_listing/domain/entities/user.dart';
import 'package:clean_code_architecture/features/user_listing/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> getUserById(int id) {
    // TODO: implement getUserById
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<User>>> getUserList() async {
    try {
      final users = await remoteDataSource.getUserList();
      return right(users.map((e) => e.toUser()).toList());
    } on ServerException catch (error) {
      return left(ServerFailure(error.error));
    }
  }
}

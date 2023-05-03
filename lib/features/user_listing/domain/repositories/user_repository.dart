import 'package:clean_code_architecture/core/error/failures.dart';
import 'package:clean_code_architecture/features/user_listing/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUserList();
  Future<Either<Failure, User>> getUserById(int id);
}
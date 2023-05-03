import 'package:clean_code_architecture/core/error/failures.dart';
import 'package:clean_code_architecture/core/usecases/usecase.dart';
import 'package:clean_code_architecture/features/user_listing/domain/entities/user.dart';
import 'package:clean_code_architecture/features/user_listing/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class GetUserListUseCase extends UseCase<List<User>, NoParams> {
  final UserRepository userRepository;

  GetUserListUseCase(this.userRepository);

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) {
    return userRepository.getUserList();
  }
}

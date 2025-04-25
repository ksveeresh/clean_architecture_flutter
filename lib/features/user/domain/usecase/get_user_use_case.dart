
import 'package:clean_architecture/features/user/domain/entity/user_entity.dart';
import 'package:clean_architecture/features/user/domain/repository/user_repository.dart';

class GetUserUseCase {
  UserRepository userRepository;

  GetUserUseCase(this.userRepository);

  Future<List<UserEntity>> call() {
    return userRepository.getUserById();
  }
}
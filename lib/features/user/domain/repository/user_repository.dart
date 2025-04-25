
import 'package:clean_architecture/features/user/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<List<UserEntity>> getUserById();
  Future insertUser(UserEntity userEntity);
}
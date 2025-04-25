import 'package:clean_architecture/features/user/domain/entity/user_entity.dart';
import 'package:clean_architecture/features/user/domain/repository/user_repository.dart';

class InsertUserUserCase {
  UserRepository repository;
  InsertUserUserCase(this.repository);

   Future save(UserEntity userEntity) {
     return repository.insertUser(userEntity);
   }
 }
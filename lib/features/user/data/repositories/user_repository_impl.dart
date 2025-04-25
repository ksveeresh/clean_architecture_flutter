
import 'package:clean_architecture/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_architecture/features/user/data/models/user_model.dart';
import 'package:clean_architecture/features/user/domain/entity/user_entity.dart';
import 'package:clean_architecture/features/user/domain/repository/user_repository.dart';



class UserRepositoryImpl implements UserRepository{
  UserLocalDataSource userLocalDataSource;
  UserRepositoryImpl(this.userLocalDataSource);

  @override
  Future<List<UserEntity>> getUserById() async {
    List<UserEntity> tempList =[];
   List tempData=await userLocalDataSource.getUserById();
    for (var action in tempData) {
      tempList.add(UserEntity(id: action.id,name: action.name,email: action.email));
    }
    return tempList;
  }

  @override
  Future insertUser(UserEntity userEntity) {
    return userLocalDataSource.insertUser(UserModel.fromMap(userEntity.toMap()));
  }

}

import 'package:clean_architecture/features/user/domain/entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({required super.id, required super.name, required super.email});

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
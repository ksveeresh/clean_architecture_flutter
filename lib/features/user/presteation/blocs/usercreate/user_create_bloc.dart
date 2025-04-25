import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:clean_architecture/features/user/domain/entity/user_entity.dart';
import 'package:clean_architecture/features/user/domain/usecase/insert_user_user_case.dart';
import 'package:meta/meta.dart';

part 'user_create_event.dart';

part 'user_create_state.dart';

class UserCreateBloc extends Bloc<UserCreateEvent, UserCreateState> {
  InsertUserUserCase useCase;

  UserCreateBloc(this.useCase) : super(UserCreateInitial()) {
    on<AddUser>(_addUser);
  }

  _addUser(AddUser event, Emitter<UserCreateState> emit) async {
    emit(UserCreateLoading());
    await useCase
        .save(UserEntity(id: 1, name: event.name, email: event.email))
        .then((onValue) {
          emit(UserCreateSuccess());
        })
        .catchError((onError) {
          emit(UserCreateFailure(onError.toString()));
        });
  }
}

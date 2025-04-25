import 'package:clean_architecture/features/user/domain/entity/user_entity.dart';
import 'package:clean_architecture/features/user/domain/usecase/get_user_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_list_event.dart';

part 'user_list_state.dart';

class UserListBloc extends Bloc<UserListEvent, UserListState> {
  GetUserUseCase getUserUseCase;

  UserListBloc(this.getUserUseCase) : super(UserListInitial()) {
    on<UserDataEvent>((event, emit) async {
      List<UserEntity> tempList = await getUserUseCase.call();
      if (tempList.isNotEmpty) {
        await Future.delayed(Duration(seconds: 1));
        var data=UserListSuccess(tempList);
        emit(data);
      } else {
        emit(UserListFailure("No Data"));
      }
    });
  }
}

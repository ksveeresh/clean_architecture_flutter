part of 'user_list_bloc.dart';

@immutable
sealed class UserListState {}

final class UserListInitial extends UserListState {}

class EventState extends UserListState {}

class UserListSuccess extends UserListState {
  List<UserEntity> dataList;

  UserListSuccess(this.dataList);
}

class UserListLoading extends UserListState {}

class UserListFailure extends EventState {
  final String error;

  UserListFailure(this.error);
}

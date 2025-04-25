part of 'user_create_bloc.dart';

@immutable
sealed class UserCreateState {}

final class UserCreateInitial extends UserCreateState {}

class EventState extends UserCreateState {}

class UserCreateSuccess extends EventState {}

class UserCreateLoading extends UserCreateState {}

class UserCreateFailure extends EventState {
  final String error;

  UserCreateFailure(this.error);
}

part of 'user_list_bloc.dart';

@immutable
sealed class UserListEvent {}

class UserDataEvent extends UserListEvent{}
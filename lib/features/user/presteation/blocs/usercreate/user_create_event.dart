part of 'user_create_bloc.dart';

@immutable
sealed class UserCreateEvent {}


class AddUser extends UserCreateEvent{
  final String name;
  final String email;

  AddUser({required this.name, required this.email});
}
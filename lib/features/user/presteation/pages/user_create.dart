import 'package:clean_architecture/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_architecture/features/user/data/repositories/user_repository_impl.dart';
import 'package:clean_architecture/features/user/domain/usecase/insert_user_user_case.dart';
import 'package:clean_architecture/features/user/presteation/blocs/usercreate/user_create_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCreate extends StatelessWidget {
  UserCreate({super.key});

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final useCase = InsertUserUserCase(
    UserRepositoryImpl(UserLocalDataSourceImpl()),);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCreateBloc>(
      create: (_) => UserCreateBloc(useCase),
      child: BlocListener<UserCreateBloc, UserCreateState>(
        listenWhen:(previous, current) {
          // Only rebuild UI when data is loaded
          return current is EventState;
        },
        listener: (c, state) {
          if (state is UserCreateSuccess) {
            nameController.clear();
            emailController.clear();
            ScaffoldMessenger.of(c).showSnackBar(
              const SnackBar(content: Text('User created successfully')),
            );
            Navigator.pop(c,true); // Optionally go back
          } else if (state is UserCreateFailure) {
            ScaffoldMessenger.of(c).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        child: BlocBuilder<UserCreateBloc, UserCreateState>(
          buildWhen: (previous, current) {
            // Only rebuild UI when data is loaded
            return current is! EventState;
          },
          builder: (c, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text("Crate User"),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: nameController,
                      decoration: const InputDecoration(labelText: 'Name'),
                    ),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                    ),
                    const SizedBox(height: 16),
                    (state is! UserCreateLoading) ? ElevatedButton(
                      onPressed: () {
                        c.read<UserCreateBloc>().add(
                          AddUser(
                            name: nameController.text,
                            email: emailController.text,
                          ),
                        );
                      },
                      child: const Text('Save User'),
                    ) : SizedBox(
                      height: 45,
                      child: CircularProgressIndicator(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

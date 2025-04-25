import 'package:clean_architecture/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_architecture/features/user/data/repositories/user_repository_impl.dart'
    show UserRepositoryImpl;
import 'package:clean_architecture/features/user/domain/usecase/get_user_use_case.dart';
import 'package:clean_architecture/features/user/presteation/blocs/userlist/user_list_bloc.dart';
import 'package:clean_architecture/features/user/presteation/pages/user_create.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserList extends StatelessWidget {
  const UserList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserListBloc>(
      create:
          (_) => UserListBloc(
            GetUserUseCase(UserRepositoryImpl(UserLocalDataSourceImpl())),
          ),
      child: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          if (state is UserListInitial) {
            context.read<UserListBloc>().add(UserDataEvent());
          }
          return Scaffold(
            appBar: AppBar(
             title: Text("User List"),
            ),
            body:
                state is UserListSuccess
                    ? ListView.builder(
                      itemCount: state.dataList.length,
                      itemBuilder: (context, index) {
                        final user = state.dataList[index];
                        return ListTile(
                          title: Text(user.name),
                          subtitle: Text(user.email),
                          leading: CircleAvatar(child: Text(user.name[0])),
                        );
                      },
                    )
                    : (state is UserListFailure)
                    ? Center(child: Text(state.error))
                    : (state is UserListInitial)
                    ? CircularProgressIndicator()
                    : Container(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => UserCreate()))
                    .then((onValue) {
                      if (onValue is bool) {
                        if (context.mounted) {
                          context.read<UserListBloc>().add(UserDataEvent());
                        }
                      }
                    });
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}

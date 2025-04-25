import 'package:clean_architecture/features/user/data/datasources/user_local_data_source.dart';
import 'package:clean_architecture/features/user/data/repositories/user_repository_impl.dart';
import 'package:clean_architecture/features/user/domain/usecase/insert_user_user_case.dart';
import 'package:clean_architecture/features/user/presteation/blocs/usercreate/user_create_bloc.dart';
import 'package:clean_architecture/features/user/presteation/pages/user_create.dart';
import 'package:clean_architecture/features/user/presteation/pages/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: UserList(),
    );
  }
}

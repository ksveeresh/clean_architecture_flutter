
import 'package:clean_architecture/features/user/data/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

abstract class UserLocalDataSource {
  Future<List<UserModel>> getUserById();
  Future<int> insertUser(UserModel userModel);
}

class UserLocalDataSourceImpl implements UserLocalDataSource {

  Database? _db;

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _initDB();
    return _db!;
  }

  Future<Database> _initDB() async {
    final path = '${await getDatabasesPath()}user_app.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE users(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            email TEXT
          )
        ''');
      },
    );
  }



  @override
  Future<List<UserModel>> getUserById() async {
    final db = await database;
    final result = await db.query('users');
    if (result.isNotEmpty) {
      List<UserModel> tempList =[];
      for (var action in result) {
        tempList.add(UserModel.fromMap(action));
      }
      return tempList;
    }
    return [];
  }

  @override
  Future<int> insertUser(UserModel userModel) async {
    final db = await database;
    int i= await db.insert('users',userModel.toMap());
    return i;
  }








}
import 'dart:async';
import 'dart:io';
import 'package:book/bookui/models/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper{
  static final DatabaseHelper _instance=new DatabaseHelper.internal();
  factory DatabaseHelper()=>_instance;
  final String id="id";
  final String tableUser="User";
  final String username="username";
  final String password="password";
  
  static Database _db;
  Future<Database> get db async{
    if(_db!=null){
      return _db;
    }
    _db=await initDb();
    return _db;
  }
    
    DatabaseHelper.internal();

    initDb() async{
      Directory documentDirectory=await getApplicationDocumentsDirectory();
      String path=join(documentDirectory.path,"main.db");
      var ourDb=await openDatabase(path,version:1,onCreate:_onCreate);
      return ourDb;
    }
    void _onCreate(Database db ,int version) async{
      await db.execute("CREATE TABLE User(id INTEGER PRIMARY KEY,username TEXT,password TEXT)");
      print("Table is created");
    }
    //insertion
    Future<int> saveUser(User user) async{
      var dbClient=await db;
      int res=await dbClient.insert("User",user.toMap());
      return res;
    }

    Future<List> getAllUsers() async{
      var dbClient=await db;
      var result=await dbClient.rawQuery("SELECT * FROM $tableUser");
      return result.toList();
    }

    Future<int> getCount() async{
      var dbClient=await db;
      return Sqflite.firstIntValue(
        await dbClient.rawQuery("SELECT COUNT(*) FROM User"));
      
    }

    Future<User> getUser(int id) async{
      var dbClient=await db;
      var result=await dbClient.rawQuery("SELECT * FROM $tableUser WHERE id=$id");
      if(result.length==0)return null;
      return new User.fromMap(result.first);
    }

    //deletion
    Future<int> deleteUser(int id) async{
      var dbClient=await db;
      int res=await dbClient.delete(tableUser);
      return res;
    }

    Future<int> updateUser(User user) async{
      var dbClient=await db;
      return await dbClient.update(tableUser,
      user.toMap(),where:"$id=?",whereArgs:[user.id]);
      // return await update;
    }
    Future close() async{
      var dbClient=await db;
      return dbClient.close();
    }

  
}
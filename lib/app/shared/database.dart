import 'package:microblogging/app/shared/constants.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class InternalDatabase {

  Database database;

  InternalDatabase() {
    this.init();
  }

  init() async{
    if(this.database == null)  {
      this.database = await this.initializeDatabase();
    }
  }

  Future<Database> initializeDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + DATABASE;

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async{
        await db.execute('''
          create table users ( 
            "id" integer primary key autoincrement, 
            "name" text not null,
            "email" text not null,
            "password" text not null,
            "dh_insert" timestamp DEFAULT CURRENT_TIMESTAMP
          );
        ''');
        await db.execute('''
          create table posts ( 
            "id" integer primary key autoincrement, 
            "content" text not null,
            "user_id" int not null,
            "dh_insert" timestamp DEFAULT CURRENT_TIMESTAMP,
            FOREIGN KEY (user_id) REFERENCES users (id)
          );
        ''');
      },
    );
    return database;
  }


}
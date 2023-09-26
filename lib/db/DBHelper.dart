import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'hfp.db'); // path + 'pacote.db';

    Database db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: onCreate,
    );
    print(dbPath);

    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE information_notice (id INTEGER PRIMARY KEY, titulo TEXT NOT NULL, descricao TEXT NOT NULL, data VARCHAR(100), fonte VARCHAR(100));';
    await db.execute(sql);

    sql =
        "INSERT INTO information_notice (id, titulo, descricao, data, fonte) VALUES (1, 'Título notícia 1', 'Descrição notícia 1', 'data notícia 1', 'Fonte notícia 1');";
    await db.execute(sql);

    sql =
        "INSERT INTO information_notice (id, titulo, descricao, data, fonte) VALUES (2, 'Título notícia 2', 'Descrição notícia 2', 'data notícia 2', 'Fonte notícia 2');";
    await db.execute(sql);

    sql =
        "INSERT INTO information_notice (id, titulo, descricao, data, fonte) VALUES (3, 'Título notícia 3', 'Descrição notícia 3', 'data notícia 3', 'Fonte notícia 3');";
    await db.execute(sql);

    sql =
        "INSERT INTO information_notice (id, titulo, descricao, data, fonte) VALUES (4, 'Título notícia 4', 'Descrição notícia 4', 'data notícia 4', 'Fonte notícia 4');";
    await db.execute(sql);
  }
}
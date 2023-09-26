import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelperCases {
  initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'cases.db'); // path + 'pacote.db';

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
        'CREATE TABLE cases (id INTEGER PRIMARY KEY AUTOINCREMENT, imagem TEXT NOT NULL, descricao TEXT NOT NULL, nome TEXT NOT NULL);';
    await db.execute(sql);

    sql =
        "INSERT INTO cases ( imagem , descricao, nome) VALUES ( 'assets/images/Gigante.jpg', 'Um lindo cachorrinho resgatado com raiva que estava dormindo dentro de uma lixeira', 'Gigante');";
    await db.execute(sql);

    sql =
        "INSERT INTO cases ( imagem, descricao, nome) VALUES ( 'assets/images/Grandão.jpg', 'Um lindo cachorrinho resgatado da rua revirando uma lata de lixo', 'Grandão');";
    await db.execute(sql);
  }
}
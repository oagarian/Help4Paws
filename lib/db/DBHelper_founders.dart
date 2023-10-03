import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  initDB() async {
    String path = await getDatabasesPath();
    String dbPath = join(path, 'hp.db'); // path + 'pacote.db';

    Database db = await openDatabase(
      dbPath,
      version: 2,
      onCreate: onCreate,
      
    );

    print(dbPath);
    return db;
  }

  Future<FutureOr<void>> onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE fundadores (id INTEGER PRIMARY KEY, nome varchar(100), avatar varchar(100), desc varchar(100));';
    await db.execute(sql);

    sql =
        "INSERT INTO fundadores (id, nome, avatar, desc) VALUES (1, 'Aline Rafaela', 'https://cdn6.campograndenews.com.br/uploads/noticias/2022/06/21/84jnw1cd8irs.jpeg', 'Desenvolvedora');";
    await db.execute(sql);

    sql =
        "INSERT INTO fundadores (id, nome, avatar, desc) VALUES (2, 'Anderson Cabral', 'https://i.pinimg.com/236x/a3/91/73/a391735ab77ae81791174667713bc75f.jpg', 'Desenvolvedor');";
    await db.execute(sql);

    sql =
        "INSERT INTO fundadores (id, nome, avatar, desc) VALUES (3, 'Thiago Natan', 'https://pbs.twimg.com/media/FXY16QuX0AM5ijD.jpg', 'Desenvolvedor e revisador');";
    await db.execute(sql);

    sql =
        "INSERT INTO fundadores (id, nome, avatar, desc) VALUES (4, 'Viviam Beatriz', 'https://cdn.vox-cdn.com/thumbor/RK0wEhiv4OeVIK4esVZ7mdB-nnw=/0x0:1280x720/920x613/filters:focal(538x258:742x462):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/58547333/ugandan_knuckles.0.jpg', 'Desenvolvedora e designer');";
    await db.execute(sql);

 
    
}
}
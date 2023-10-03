import 'package:help4paws/db/DBHelper_founders.dart';
import 'package:help4paws/domain/founder.dart';
import 'package:sqflite/sqflite.dart';

class FounderDao {

  Future<List<Founder>>  findAll() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM fundadores;';
    final resultSet = await db.rawQuery(sql);

    List<Founder> list = [];
    for (var json in resultSet) {
      Founder pacote = Founder.fromJson(json);
      list.add(pacote);
    }

    return list;

  }
}


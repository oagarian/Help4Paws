import 'package:help4paws/domain/notices.dart';
import 'package:sqflite/sqflite.dart';
import '../db/DBHelper.dart';

class NoticesDAO {
  Future<List<Notices>> getNotices() async {
    DBHelper dbHelper = DBHelper();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM information_notice;';
    final resultSet = await db.rawQuery(sql);

    List<Notices> list = [];
    for (var json in resultSet) {
      Notices noticias = Notices.fromJson(json);
      list.add(noticias);
    }

    return list;
  }
}
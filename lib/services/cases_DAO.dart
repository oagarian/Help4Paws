import 'package:help4paws/db/DBHelper_cases.dart';
import 'package:help4paws/domain/cases.dart';
import 'package:sqflite/sqflite.dart';

class CasesDAO {
  Future<List<Case>> getCases() async {
    DBHelperCases dbHelper = DBHelperCases();
    Database db = await dbHelper.initDB();

    String sql = 'SELECT * FROM cases;';
    final resultSet = await db.rawQuery(sql);

    List<Case> list = [];
    for (var json in resultSet) {
      Case cases = Case.fromJSON(json);
      list.add(cases);
    }

    return list;
  }
}
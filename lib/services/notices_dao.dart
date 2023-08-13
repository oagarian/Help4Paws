import 'package:postgres/postgres.dart';

class NoticesDAO {
  final PostgreSQLConnection _connection;

  NoticesDAO(this._connection);

  Future<List<PostgreSQLResultRow>> getNotices(int limit) async {
    final noticesData = await _connection.query(
      'SELECT * FROM notices ORDER BY id DESC LIMIT @limit;',
      substitutionValues: {'limit': limit},
    );
    return noticesData.toList();
  }

}

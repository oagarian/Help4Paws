import 'package:postgres/postgres.dart';

class AssociatedsDAO {
  final PostgreSQLConnection _connection;

  AssociatedsDAO(this._connection);

  Future<List<PostgreSQLResultRow>> getAssociateds(int limit) async {
    final result = await _connection.query(
      'SELECT asscName, logoImage, asscDescription, email, contactNumber, pix, street, descriptionAddr FROM associateds ORDER BY id LIMIT @limit;',
      substitutionValues: {'limit': limit},
    );
    return result.toList();
  }
  
  Future<int> getAssociatedsCount() async {
    final result = await _connection.query(
      'SELECT COUNT(*) FROM associateds;',
    );
    final rowCount = result[0][0] as int;
    return rowCount;
  }

}

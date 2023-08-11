import 'package:postgres/postgres.dart';
import 'database_connect.dart';

class AssociatedsDAO {
  final PostgreSQLConnection _connection;

  AssociatedsDAO(this._connection);

  Future<List<PostgreSQLResultRow>> getAssociateds(int limit) async {
    final result = await _connection.query(
      'SELECT * FROM associateds ORDER BY id LIMIT @limit;',
      substitutionValues: {'limit': limit},
    );
    return result.toList();
  }

  Future<List<PostgreSQLResultRow>> getAssociatedsFromLocation(String location, int limit) async {
    final result = await _connection.query(
      'SELECT * FROM associateds ORDER BY CASE WHEN descriptionAddr LIKE @location THEN 0 ELSE 1 END LIMIT @limit;',
      substitutionValues: {'location': '%$location%', 'limit': limit},
    );
    return result.toList();
  }

  Future<List<PostgreSQLResultRow>> getAssociatedsInverted(int limit) async {
    final result = await _connection.query(
      'SELECT * FROM associateds ORDER BY id DESC LIMIT @limit;',
      substitutionValues: {'limit': limit},
    );
    return result.toList();
  }




}

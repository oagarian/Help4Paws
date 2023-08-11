import 'package:postgres/postgres.dart';

class DatabaseConnect {
  static Future<PostgreSQLConnection> connect() async {
    final connection = PostgreSQLConnection(
      'localhost',
      8080,
      'help4paws',
      username: 'root',
      password: 'password',
    );

    await connection.open();
    return connection;
  }
}
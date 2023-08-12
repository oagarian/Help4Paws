import 'package:postgres/postgres.dart';

class DatabaseConnect {
  static Future<PostgreSQLConnection> connect() async {
    final connection = PostgreSQLConnection(
      'localhost', 
      5432,
      'help4paws', 
      username: 'root', 
      password: 'password', 
    );

    await connection.open();
    return connection;
  }
}

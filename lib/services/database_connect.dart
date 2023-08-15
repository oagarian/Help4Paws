import 'package:mongo_dart/mongo_dart.dart';

class DatabaseConnect {
 static getConnection() async {
  try {
    var db = await Db.create("mongodb+srv://admin:admin@help4paws.jmhhf4h.mongodb.net/?retryWrites=true&w=majority");
    await db.open();
    return db;
  } catch(err) {

  }
 
 }
 
}
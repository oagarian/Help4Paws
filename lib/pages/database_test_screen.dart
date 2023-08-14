import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';

class DatabaseTestScreen extends StatelessWidget {
  final String connectionString = 'mongodb+srv://admin:admin@help4paws.jmhhf4h.mongodb.net/?retryWrites=true&w=majority';

  const DatabaseTestScreen({super.key});

  Future<void> _printFirstRowData() async {
    final db = Db(connectionString);
    await db.open();
    final collection = db.collection('help4paws'); // Nome da coleção
    final cursor = await collection.find();
    await cursor.forEach((document) { 
      print('Row Data:');
      print('asscName: ${document['asscName']}');
      print('logoImage: ${document['logoImage']}');
      print('asscDescription: ${document['asscDescription']}');
      print('email: ${document['email']}');
      print('contactNumber: ${document['contactNumber']}');
      print('pix: ${document['pix']}');
      print('street: ${document['street']}');
      print('descriptionAddr: ${document['descriptionAddr']}');
    });
    await db.close();


}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child:
            ElevatedButton(
            onPressed: _printFirstRowData,
            child: Text('Imprimir Informações da Row'),
        ),
        )
      ),
    );
  }
}



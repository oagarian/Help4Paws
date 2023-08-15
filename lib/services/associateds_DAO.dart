import 'package:mongo_dart/mongo_dart.dart';
import '../widgets/associateds_widget.dart';

class AssociatedsDAO {
  final List<AssociatedsContainer> associatedsList = [];
  Future<List<AssociatedsContainer>> getAssociateds(
      int limit, int option) async {
    int counter = 0;
    Db db;
    db = await Db.create(
        'mongodb+srv://admin:admin@help4paws.jmhhf4h.mongodb.net/help4paws?retryWrites=true&w=majority');
    await db.open();
    final collection = db.collection("associateds");
    final Stream<Map<String, dynamic>> cursor;
    if(option == 1) {
      cursor = await collection.find(where.sortBy("_id", descending: true));
    } else {
      cursor = await collection.find(where.sortBy("_id", descending: false));
    }
    await cursor.forEach((data) {
        counter++;
        if (counter <= limit) {
          final name = data['asscName'] as String;
          final image = data['logoImage'] as String;
          final desc = data['asscDescription'] as String;
          final email = data['email'] as String;
          final number = data['contactNumber'] as String;
          final pix = data['pix'] as String;
          final street = data['street'] as String;
          final descAdr = data['descriptionAddr'] as String;
          final associatedWidget = AssociatedsContainer(
              image: image,
              name: name,
              desc: desc,
              email: email,
              number: number,
              street: street,
              descAdr: descAdr,
              pix: pix);
          associatedsList.add(associatedWidget);
        

      }
    });
    return associatedsList;
  }

  Future<int> getTotal() async {
    Db db;
    db = await Db.create(
        'mongodb+srv://admin:admin@help4paws.jmhhf4h.mongodb.net/help4paws?retryWrites=true&w=majority');
    await db.open();
    final collection = db.collection("associateds");
    final amount = await collection.count();
    return amount;
  }
}

import 'package:help4paws/services/database_connect.dart';
import 'package:help4paws/widgets/associateds_widget.dart';
import 'package:mongo_dart/mongo_dart.dart';

class AssociatedsDAO {
  final DbCollection collection;

  AssociatedsDAO() : collection = DatabaseConnect.getConnection().collection("associateds");

  Future<List<AssociatedsContainer>> getAssociatedsList() async {
    final List<AssociatedsContainer> associatedsList = [];

    final cursor = await collection.find();
    await cursor.forEach((data) {
      final name = data['asscName'] as String;
      final image = data['email'] as String;
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
    });
    return associatedsList;
  }

  Future<int> getTotal() async {
    final amount = await collection.count();
    return amount;
  }

}

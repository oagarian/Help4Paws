import 'package:help4paws/domain/cases.dart';

class CasesDAO {
  var cases = const [
    Case(
      image: 'assets/images/Gigante.jpg',
      name: 'Gigante',
      desc:
          'Um lindo cachorrinho resgatado com raiva que estava dormindo dentro de uma lixeira',
    ),
    Case(
      image: 'assets/images/Grandão.jpg',
      name: 'Grandão',
      desc: 'Um lindo cachorrinho resgatado da rua revirando uma lata de lixo',
    ),
  ];

  Future<List<Case>> findAll() async {
    await Future.delayed(const Duration(seconds: 10));
    return cases;
  }
}
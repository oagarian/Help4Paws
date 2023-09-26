class Case {
  late int id;
  late String image;
  late String desc;
  late String name;

  Case({
    required this.id,
    required this.image,
    required this.desc,
    required this.name,
  });

  Case.fromJSON(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nome'];
    desc = json['descricao'];
    image = json['imagem'];
  }
}
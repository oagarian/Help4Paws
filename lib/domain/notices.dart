class Notices {
  late int id;
  late String titulo;
  late String descricao;
  late String data;
  late String fonte;

  Notices(
      {required this.id,
      required this.titulo,
      required this.descricao,
      required this.data,
      required this.fonte});

  Notices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titulo = json['titulo'];
    descricao = json['descricao'];
    data = json['data'];
    fonte = json['fonte'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['titulo'] = titulo;
    data['descricao'] = descricao;
    data['data'] = data;
    data['fonte'] = fonte;
    return data;
  }
}
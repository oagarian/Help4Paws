class Founder {
  late String nome;
  late String avatar;
  late String desc;
  

  Founder(
      {required this.nome,
      required this.avatar,
      required this.desc,
      });

  Founder.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    avatar = json['avatar'];
    desc = json['desc'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['nome'] = this.nome;
    data['imagem'] = this.avatar;
    data['cidade'] = this.desc;
    return data;
  }
}
class PrincipalModel {
  final String titulo;
  final String data;
  final String tituloNoticia;
  final String descricao;

  PrincipalModel({
    required this.titulo,
    required this.data,
    required this.tituloNoticia,
    required this.descricao,
  });

  factory PrincipalModel.fromJson(Map<String, dynamic> json) {
    return PrincipalModel(
      titulo: json['Titulo'],
      data: json['Data'],
      tituloNoticia: json['TituloNoticia'],
      descricao: json['Descricao'],
    );
  }
}
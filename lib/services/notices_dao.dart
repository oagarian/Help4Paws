import 'package:help4paws/widgets/notices_widget.dart';

class NoticesDAO {

  var notices = const [
    NoticesContainer(
      titulo: "Título notícia 1", 
      data: "data notícia 1", 
      descricaoNoticia: "Descrição noticia 1", 
      fonte: "Fonte noticia 1"
    ),
    NoticesContainer(
      titulo: "Título notícia 2", 
      data: "data notícia 2", 
      descricaoNoticia: "Descrição noticia 2", 
      fonte: "Fonte noticia 2"
    ),
    NoticesContainer(
      titulo: "Título notícia 3", 
      data: "data notícia 3", 
      descricaoNoticia: "Descrição noticia 3", 
      fonte: "Fonte noticia 3"
    ),
    NoticesContainer(
      titulo: "Título notícia 4", 
      data: "data notícia 4", 
      descricaoNoticia: "Descrição noticia 4", 
      fonte: "Fonte noticia 4"
    ),
    NoticesContainer(
      titulo: "Título notícia 5", 
      data: "data notícia 5", 
      descricaoNoticia: "Descrição noticia 5", 
      fonte: "Fonte noticia 5"
    ),
    NoticesContainer(
      titulo: "Título notícia 6", 
      data: "data notícia 6", 
      descricaoNoticia: "Descrição noticia 6", 
      fonte: "Fonte noticia 6"
    ),
    NoticesContainer(
      titulo: "Título notícia 7", 
      data: "data notícia 7", 
      descricaoNoticia: "Descrição noticia 7", 
      fonte: "Fonte noticia 7"
    ),
    NoticesContainer(
      titulo: "Título notícia 8", 
      data: "data notícia 8", 
      descricaoNoticia: "Descrição noticia 8", 
      fonte: "Fonte noticia 8"
    ),

  ];

  Future<List<NoticesContainer>> getNotices() async {
    await Future.delayed(const Duration(milliseconds: 2500));
    return notices;
  }

}

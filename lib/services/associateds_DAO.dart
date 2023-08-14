import 'package:help4paws/widgets/associateds_widget.dart';

class AssociatedsDAO {

  var associateds = const [
    AssociatedsContainer(
      image:
          'https://res.cloudinary.com/buzzfeed-brasil/image/upload/v1666725892/image-uploads/quiz-result-image/jpeg/bc8711484c49fa6f0f167f8fa797d3b9.jpg',
      name: 'Abrigo Serrotino',
      desc:
          'O abrigo Serrotino foi criado em 2003 pela veterinária Josefa de Andrade e se tornou um dos primeiros parceiros do H4P, cedendo espaço e tratamento para cães, gatos, entre outros animais, resgatados por nossa equipe.',
      email: 'contato@exemplo.com',
      number: '123-456-7890',
      street: 'Rua Principal, 123',
      descAdr: 'Serrote',
      pix: 'tns6@aluno.ifal.edu.br',
    ),
    AssociatedsContainer(
      image:
          'https://scontent.fapq11-1.fna.fbcdn.net/v/t1.6435-9/118516568_142219120878769_7579589625503818926_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=c2f564&_nc_eui2=AeEXajnJp4vOmGVfiFOtEV3mjHL1ye9SaXWMcvXJ71JpdV5GMc6PCIaw4L5AvQZ1f_-ir-K-OE2oTp8tL-cAzL7h&_nc_ohc=YjiTkMQb1CEAX_PIgoG&_nc_ht=scontent.fapq11-1.fna&oh=00_AfAPeTe2Tmc27TZhPAd68wjyPpnADyptoZUx5dFr5S3smw&oe=64FE212E',
      name: 'B&C Company',
      desc:
          'A B&C Company se tornou nossa parceira em 2018, fazendo doações de materiais, remédios e até mesmo de mantimentos necessários para ajudar os animais resgatados.',
      email: 'contato@exemplo.com',
      number: '123-456-7890',
      street: 'Rua Principal, 123',
      descAdr: 'Maragogi',
      pix: 'tns6@aluno.ifal.edu.br',
    ),
    AssociatedsContainer(
      image:
          'https://observatorio3setor.org.br/wp-content/uploads/2021/07/AdobeStock_120826845-768x512.jpeg',
      name: 'Associação Amigos dos Animais',
      desc:
          'Uma associação dedicada ao bem-estar animal, resgatando e cuidando de cães e gatos em situação de vulnerabilidade.',
      email: 'contato@amigosdosanimais.com',
      number: '111-111-1111',
      street: 'Rua dos Amigos, 123',
      descAdr: 'Mogi das Cruzes',
      pix: 'pix@amigosdosanimais.com',
    ),
    AssociatedsContainer(
      image:
          'https://observatorio3setor.org.br/wp-content/uploads/2021/07/AdobeStock_124563900.jpeg',
      name: 'Protetores da Natureza',
      desc:
          'Nossa missão é preservar a fauna e a flora por meio da conscientização, educação ambiental e ações de proteção.',
      email: 'contato@protetoresdanatureza.com',
      number: '222-222-2222',
      street: 'Avenida das Árvores, 456',
      descAdr: 'Joinvile',
      pix: 'pix@protetoresdanatureza.com',
    ),
    AssociatedsContainer(
      image:
          'https://observatorio3setor.org.br/wp-content/uploads/2021/07/AdobeStock_124563900.jpeg',
      name: 'Casa dos Bichinhos Felizes',
      desc:
          'Oferecemos um lar temporário para animais resgatados, proporcionando cuidados e amor até encontrarem um lar definitivo.',
      email: 'contato@casadosbichinhos.com',
      number: '333-333-3333',
      street: 'Rua dos Felinos, 789',
      descAdr: 'Rio Grande do Sul',
      pix: 'pix@casadosbichinhos.com',
    ),
    AssociatedsContainer(
      image:
          'https://image.cachorrogato.com.br/textimages/protetores-animais.jpg',
      name: 'Unidos Pelos Patinhas',
      desc:
          'Nossa associação atua no resgate e reabilitação de animais em situação de abandono e maus-tratos, buscando um futuro melhor para eles.',
      email: 'contato@unidospelospatinhas.com',
      number: '444-444-4444',
      street: 'Rua das Patas, 101',
      descAdr: 'Roraima',
      pix: 'pix@unidospelospatinhas.com',
    ),
    AssociatedsContainer(
      image:
          'https://image.cachorrogato.com.br/textimages/sociedade-protetora-animais-filhotes-gato.jpg',
      name: 'Amor pelos Peludos',
      desc:
          'Nosso trabalho é promover o amor e o cuidado com animais de estimação, oferecendo informações e suporte para tutores responsáveis.',
      email: 'contato@amorpelospeludos.com',
      number: '555-555-555',
      street: 'Rua dos Cãezinhos, 222',
      descAdr: 'Paraiba',
      pix: 'pix@amorpelospeludos.com',
    ),
    AssociatedsContainer(
      image:
          'https://image.cachorrogato.com.br/textimages/sociedade-protetora-animais-gatos.jpg',
      name: 'Resgate Animal Brasil',
      desc:
          'Trabalhamos incansavelmente para resgatar animais em situações de risco, oferecendo cuidados médicos e auxílio para encontrar novos lares.',
      email: 'contato@resgateanimalbrasil.com',
      number: '666-666-6666',
      street: 'Rua dos Animais, 555',
      descAdr: 'Rio de Janeiro',
      pix: 'pix@resgateanimalbrasil.com',
    ),
    AssociatedsContainer(
      image:
          'https://s2-g1.glbimg.com/7oxSo9rjxX337nDOQQGM6x1hjbk=/0x0:1280x960/600x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2020/1/s/zCySi9QyaCZw0MVkBICw/filhotes-de-caes-disponiveis-para-adocao-na-apa-em-uberlandia-1-.jpeg',
      name: 'Aconchego Animal',
      desc:
          'Proporcionamos conforto e cuidados para animais idosos e debilitados, garantindo que desfrutem de uma vida digna e cheia de carinho.',
      email: 'contato@aconchegoanimal.com',
      number: '777-777-7777',
      street: 'Avenida dos Vovôs, 777',
      descAdr: 'Penedo',
      pix: 'pix@aconchegoanimal.com',
    ),
    AssociatedsContainer(
      image:
          'https://s2-g1.glbimg.com/Lm_IREU7or2c4SLTG5NMrYxpzAE=/0x280:960x1084/600x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2020/r/A/UtVYXYTc2KuYyPYR7sIw/filhotes-de-gatos-disponiveis-para-adocao-na-apa-em-uberlandia.jpeg',
      name: 'Salvando Patinhas',
      desc:
          'Com paixão e determinação, resgatamos animais em situação de perigo, oferecendo cuidados e uma chance de ter uma vida feliz.',
      email: 'contato@salvandopatinhas.com',
      number: '888-888-8888',
      street: 'Rua dos Heróis, 888',
      descAdr: 'Maceió',
      pix: 'pix@salvandopatinhas.com',
    ),
  ];

  Future<List<AssociatedsContainer>> getAssociateds({required int amount}) async {
    await Future.delayed(const Duration(milliseconds: 2500));
    List<AssociatedsContainer> list = [];
    int count = 0;
    for(var item in associateds) {
      count++;
      if(count <= amount) {
        list.add(item);
      } 
    }
    return list;
  }

  int getTotal() {
    return associateds.length;
  }
}

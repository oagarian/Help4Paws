CREATE TABLE associateds (
    id serial primary key not null,
    asscName text not null,
    logoImage text not null,
    asscDescription text not null,
    email text not null,
    contactNumber text not null,
    pix text not null,
    street text not null,
    descriptionAddr text not null
);

INSERT INTO associateds (
    asscName, logoImage, asscDescription, email, contactNumber, pix, street, descriptionAddr
) VALUES (
    'Abrigo Serrotino',
    'https://res.cloudinary.com/buzzfeed-brasil/image/upload/v1666725892/image-uploads/quiz-result-image/jpeg/bc8711484c49fa6f0f167f8fa797d3b9.jpg',
    'UO abrigo Serrotino foi criado em 2003 pela veterinária Josefa de Andrade e se tornou um dos primeiros parceiros do H4P, cedendo espaço e tratamento para cães, gatos, entre outros animais, resgatados por nossa equipe.',
    'contato@exemplo.com',
    '123-456-7890',
    'tns6@aluno.ifal.edu.br',
    'Rua Principal, 123',
    'Serrote'
);

INSERT INTO associateds (
    asscName, logoImage, asscDescription, email, contactNumber, pix, street, descriptionAddr
) VALUES (
    'B&C Company',
    'https://scontent.fapq11-1.fna.fbcdn.net/v/t1.6435-9/118516568_142219120878769_7579589625503818926_n.jpg?_nc_cat=108&ccb=1-7&_nc_sid=c2f564&_nc_eui2=AeEXajnJp4vOmGVfiFOtEV3mjHL1ye9SaXWMcvXJ71JpdV5GMc6PCIaw4L5AvQZ1f_-ir-K-OE2oTp8tL-cAzL7h&_nc_ohc=YjiTkMQb1CEAX_PIgoG&_nc_ht=scontent.fapq11-1.fna&oh=00_AfAPeTe2Tmc27TZhPAd68wjyPpnADyptoZUx5dFr5S3smw&oe=64FE212E',
    'A B&C Company se tornou nossa parceira em 2018, fazendo doações de materiais, remédios e até mesmo de mantimentos necessários para ajudar os animais resgatados.',
    'contato@exemplo.com',
    '123-456-7890',
    'tns6@aluno.ifal.edu.br',
    'Rua Principal, 123',
    'Maragogi'
);

-- Exemplo 1
INSERT INTO associateds (
    asscName, logoImage, asscDescription, email, contactNumber, pix, street, descriptionAddr
) VALUES (
    'Associação Amigos dos Animais',
    'https://observatorio3setor.org.br/wp-content/uploads/2021/07/AdobeStock_120826845-768x512.jpeg',
    'Uma associação dedicada ao bem-estar animal, resgatando e cuidando de cães e gatos em situação de vulnerabilidade.',
    'contato@amigosdosanimais.com',
    '111-111-1111',
    'pix@amigosdosanimais.com',
    'Rua dos Amigos, 123',
    'Cidade dos Animais'
);

-- Exemplo 2
INSERT INTO associateds (
    asscName, logoImage, asscDescription, email, contactNumber, pix, street, descriptionAddr
) VALUES (
    'Protetores da Natureza',
    'https://observatorio3setor.org.br/wp-content/uploads/2021/07/AdobeStock_124563900.jpeg',
    'Nossa missão é preservar a fauna e a flora por meio da conscientização, educação ambiental e ações de proteção.',
    'contato@protetoresdanatureza.com',
    '222-222-2222',
    'pix@protetoresdanatureza.com',
    'Avenida das Árvores, 456',
    'Cidade Ecológica'
);

-- Exemplo 3
INSERT INTO associateds (
    asscName, logoImage, asscDescription, email, contactNumber, pix, street, descriptionAddr
) VALUES (
    'Casa dos Bichinhos Felizes',
    'https://observatorio3setor.org.br/wp-content/uploads/2021/07/AdobeStock_124563900.jpeg',
    'Oferecemos um lar temporário para animais resgatados, proporcionando cuidados e amor até encontrarem um lar definitivo.',
    'contato@casadosbichinhos.com',
    '333-333-3333',
    'pix@casadosbichinhos.com',
    'Rua dos Felinos, 789',
    'Cidade dos Peludos'
);

-- Exemplo 4
INSERT INTO associateds (
    asscName, logoImage, asscDescription, email, contactNumber, pix, street, descriptionAddr
) VALUES (
    'Unidos Pelos Patinhas',
    'https://image.cachorrogato.com.br/textimages/protetores-animais.jpg',
    'Nossa associação atua no resgate e reabilitação de animais em situação de abandono e maus-tratos, buscando um futuro melhor para eles.',
    'contato@unidospelospatinhas.com',
    '444-444-4444',
    'pix@unidospelospatinhas.com',
    'Rua das Patas, 101',
    'Cidade Solidária'
);

-- Exemplo 5
INSERT INTO associateds (
    asscName, logoImage, asscDescription, email, contactNumber, pix, street, descriptionAddr
) VALUES (
    'Amor pelos Peludos',
    'https://image.cachorrogato.com.br/textimages/sociedade-protetora-animais-filhotes-gato.jpg',
    'Nosso trabalho é promover o amor e o cuidado com animais de estimação, oferecendo informações e suporte para tutores responsáveis.',
    'contato@amorpelospeludos.com',
    '555-555-555',
    'pix@amorpelospeludos.com',
    'Rua dos Cãezinhos, 222',
    'Cidade dos Amantes de Pets'
);

-- Exemplo 6
INSERT INTO associateds (
    asscName, logoImage, asscDescription, email, contactNumber, pix, street, descriptionAddr
) VALUES (
    'Resgate Animal Brasil',
    'https://image.cachorrogato.com.br/textimages/sociedade-protetora-animais-gatos.jpg',
    'Trabalhamos incansavelmente para resgatar animais em situações de risco, oferecendo cuidados médicos e auxílio para encontrar novos lares.',
    'contato@resgateanimalbrasil.com',
    '666-666-6666',
    'pix@resgateanimalbrasil.com',
    'Rua dos Animais, 555',
    'Cidade dos Protetores'
);

-- Exemplo 7
INSERT INTO associateds (
    asscName, logoImage, asscDescription, email, contactNumber, pix, street, descriptionAddr
) VALUES (
    'Aconchego Animal',
    'https://s2-g1.glbimg.com/7oxSo9rjxX337nDOQQGM6x1hjbk=/0x0:1280x960/600x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2020/1/s/zCySi9QyaCZw0MVkBICw/filhotes-de-caes-disponiveis-para-adocao-na-apa-em-uberlandia-1-.jpeg',
    'Proporcionamos conforto e cuidados para animais idosos e debilitados, garantindo que desfrutem de uma vida digna e cheia de carinho.',
    'contato@aconchegoanimal.com',
    '777-777-7777',
    'pix@aconchegoanimal.com',
    'Avenida dos Vovôs, 777',
    'Cidade dos Corações Bondosos'
);

-- Exemplo 8
INSERT INTO associateds (
    asscName, logoImage, asscDescription, email, contactNumber, pix, street, descriptionAddr
) VALUES (
    'Salvando Patinhas',
    'https://s2-g1.glbimg.com/Lm_IREU7or2c4SLTG5NMrYxpzAE=/0x280:960x1084/600x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2020/r/A/UtVYXYTc2KuYyPYR7sIw/filhotes-de-gatos-disponiveis-para-adocao-na-apa-em-uberlandia.jpeg',
    'Com paixão e determinação, resgatamos animais em situação de perigo, oferecendo cuidados e uma chance de ter uma vida feliz.',
    'contato@salvandopatinhas.com',
    '888-888-8888',
    'pix@salvandopatinhas.com',
    'Rua dos Heróis, 888',
    'Cidade dos Anjos de Quatro Patas'
);


CREATE TABLE notices (
    id serial primary key not null,
    titulo text not null,
    dataNoticia text not null,
    descricaoNoticia text not null,
    fonte text not null
);

-- Exemplo 1
INSERT INTO notices (titulo, dataNoticia, descricaoNoticia, fonte) VALUES (
    'Descoberta de Nova Espécie de Borboleta',
    '2023-08-13',
    'Pesquisadores encontram borboleta rara na Floresta Amazônica.',
    'Revista de Biologia'
);

-- Exemplo 2
INSERT INTO notices (titulo, dataNoticia, descricaoNoticia, fonte) VALUES (
    'Resgate de Filhote de Baleia Encalhado',
    '2023-07-25',
    'Equipe de resgate salva filhote de baleia após encalhe.',
    'ONG de Proteção Marinha'
);

-- Exemplo 3
INSERT INTO notices (titulo, dataNoticia, descricaoNoticia, fonte) VALUES (
    'Tartaruga Marinha Faz Jornada de Milhares de Quilômetros',
    '2023-08-01',
    'Tartaruga marinha percorre incrível trajetória migratória.',
    'Estudo de Ecologia Marinha'
);

-- Exemplo 4
INSERT INTO notices (titulo, dataNoticia, descricaoNoticia, fonte) VALUES (
    'Lançamento de Reserva Natural para Elefantes',
    '2023-07-18',
    'Nova reserva é criada para proteger elefantes ameaçados.',
    'Associação de Conservação Animal'
);

-- Exemplo 5
INSERT INTO notices (titulo, dataNoticia, descricaoNoticia, fonte) VALUES (
    'Descoberta de Comportamento Curioso em Macacos',
    '2023-06-10',
    'Estudo revela novo comportamento social em macacos.',
    'Instituto de Primatologia'
);

-- Exemplo 6
INSERT INTO notices (titulo, dataNoticia, descricaoNoticia, fonte) VALUES (
    'Espécie de Pássaro Rara Avistada na Cidade',
    '2023-08-08',
    'Ornitólogos registram aparição de pássaro raro em área urbana.',
    'Sociedade de Ornitologia'
);

-- Exemplo 7
INSERT INTO notices (titulo, dataNoticia, descricaoNoticia, fonte) VALUES (
    'Programa de Conservação Salva Espécie Ameaçada de Extinção',
    '2023-07-05',
    'População de lobo selvagem se recupera graças a esforços de conservação.',
    'Fundação de Preservação da Vida Selvagem'
);

-- Exemplo 8
INSERT INTO notices (titulo, dataNoticia, descricaoNoticia, fonte) VALUES (
    'Reabilitação de Ursos Órfãos Retorna-os à Natureza',
    '2023-08-20',
    'Centro de reabilitação auxilia ursos órfãos a voltarem ao habitat natural.',
    'Centro de Reabilitação da Vida Selvagem'
);

-- Exemplo 9
INSERT INTO notices (titulo, dataNoticia, descricaoNoticia, fonte) VALUES (
    'Pesquisa Revela Comunicação Complexa em Golfinhos',
    '2023-07-12',
    'Estudo aponta sofisticados padrões de comunicação entre golfinhos.',
    'Revista de Cognição Animal'
);

-- Exemplo 10
INSERT INTO notices (titulo, dataNoticia, descricaoNoticia, fonte) VALUES (
    'Novo Santuário para Rinocerontes Negros',
    '2023-06-28',
    'Santuário é inaugurado visando a proteção dos rinocerontes negros.',
    'Organização de Preservação da Fauna'
);


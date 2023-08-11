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
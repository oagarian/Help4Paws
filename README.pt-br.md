[![en](https://img.shields.io/badge/lang-en-red.svg)](https://github.com/oagarian/Help4Paws/blob/develop/README.md)
# Help4Paws

Aplicação desenvolvida em [Flutter](https://flutter.dev/), como meio de aprendizado, e com o objetivo de agregar conhecimento aos envolvidos no projeto.

## O que é o projeto

O aplicativo Help4Paws (H4P) é uma plataforma que visa facilitar a doação para organizações de cuidados a animais em sitação de rua.
Nele, é possível listar redes de voluntários, ver detalhes, casos, contato, e até mesmo gerar o QR para realização de um pix anônimo.

## Telas do projeto
Light theme:

![Help4Paws LightTeme](https://github.com/oagarian/Help4Paws/assets/102990211/94208707-d528-4da7-9718-d8b8fb388041)

Dark theme:

![Help4Paws DarkTheme](https://github.com/oagarian/Help4Paws/assets/102990211/93ad2ab6-0850-4c7f-b521-44815b503c27)

## Tecnologias usadas
Durante o projeto, foram utilzizadas diversas tecnologias, sendo:
No mobile:
- Flutter (Framework mobile para a linguagem Dart)
- SQLite para armazenar dados de baixo peso em memória
- Consumo da [API para gerar QRCode](https://github.com/ceciliadeveza/gerarqrcodepix)
- SharedPreferences para uma armazenamento de configurações (como LightTheme e DarkTheme)
No [BackEnd](https://github.com/oagarian/api-help4paws)
- Golang [https://go.dev/](https://go.dev/)
- Framework [GoFiber](https://docs.gofiber.io/)
- Banco de dados PostgreSQL
- [SQLC](https://sqlc.dev/) para criação de queries automaticamente
- Docker para passar a API para um container

## Pré-requisitos para rodar o projeto
- Tenha a linguagem Dart e framework flutter instalado na máquina, veja como [aqui](https://docs.flutter.dev/get-started/install)
- Para que tudo rode corretamente, é necessário ter a [API](https://github.com/oagarian/api-help4paws) rodando, veja como fazer isso lendo seu README.MD
- Tenha um dispositivo móvel ativo na máquina

## Como rodar o projeto

- Faça clone do repositório em sua máquina

  `git clone https://github.com/oagarian/Help4Paws`
- Resolva as dependências

  `flutter pub get`

- Crie um arquivo `.env` e copie para ele as informaçõs do arquivo [`.env.example`](https://github.com/oagarian/Help4Paws/blob/develop/.env.example) (caso esteja numa máquina linux, apenas execute: 

  `cp .env.example .env`

- Rode o projeto (necessário haver um dispositivo mobile conectado a máquina, seja ele virtual ou não)

  `flutter run`

### Observação:
Tem-se noção de problemas encontrados no código, tal qual a própria aplicação e seu histórico de commits, o que requer uma refatoração, todavia, não há previsão de quando ocorrerá.


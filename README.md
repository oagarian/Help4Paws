[![pt-br](https://img.shields.io/badge/lang-pt--br-green.svg)](https://github.com/oagarian/Help4Paws/blob/develop/README.pt-br.md)
# Help4Paws

An application developed in [Flutter](https://flutter.dev/) as a means of learning and aiming to add knowledge to those involved in the project.

## What the Project Is

The Help4Paws (H4P) app is a platform designed to facilitate donations to organizations caring for street animals. It allows users to list networks of volunteers, view details, cases, and contacts, and even generate a QR code for making anonymous Pix donations.

## Project Screens
Light theme:

![Help4Paws LightTheme](https://github.com/oagarian/Help4Paws/assets/102990211/94208707-d528-4da7-9718-d8b8fb388041)

Dark theme:

![Help4Paws DarkTheme](https://github.com/oagarian/Help4Paws/assets/102990211/93ad2ab6-0850-4c7f-b521-44815b503c27)

## Technologies Used
Throughout the project, various technologies were used:
On mobile:
- Flutter (a mobile framework for the Dart language)
- SQLite for lightweight in-memory data storage
- Consumption of the [API to generate QRCode](https://github.com/ceciliadeveza/gerarqrcodepix)
- SharedPreferences for storing settings (such as LightTheme and DarkTheme)
On the [BackEnd](https://github.com/oagarian/api-help4paws)
- Golang [https://go.dev/](https://go.dev/)
- Framework [GoFiber](https://docs.gofiber.io/)
- PostgreSQL database
- [SQLC](https://sqlc.dev/) for automatically creating queries
- Docker to containerize the API

## Prerequisites to Run the Project
- Have the Dart language and Flutter framework installed on your machine, see how [here](https://docs.flutter.dev/get-started/install)
- For everything to run correctly, you need to have the [API](https://github.com/oagarian/api-help4paws) running, see how to do this by reading its README.md
- Have an active mobile device connected to the machine

## How to Run the Project

- Clone the repository to your machine

  `git clone https://github.com/oagarian/Help4Paws`
- Resolve dependencies

  `flutter pub get`

- Create a `.env` file and copy the information from the [`.env.example`](https://github.com/oagarian/Help4Paws/blob/develop/.env.example) file (if you're on a Linux machine, just run:

  `cp .env.example .env`

- Run the project (a mobile device must be connected to the machine, whether virtual or not)

  `flutter run`

### Note:
We are aware of issues in the code, as well as the application and its commit history, which requires refactoring. However, there is no forecast of when this will occur.

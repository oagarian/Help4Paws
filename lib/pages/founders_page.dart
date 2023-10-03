import 'package:flutter/material.dart';
import 'package:help4paws/services/founders.dart';
import '../db/DBHelper_founders.dart';
import '../domain/founder.dart';

class FoundersPage extends StatefulWidget {
  const FoundersPage({super.key});

  @override
  State<FoundersPage> createState() => _FoundersPageState();
}

class _FoundersPageState extends State<FoundersPage> {
  Future<List<Founder>> futureList = FounderDao().findAll();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          body: ListView(
            children: [
              buildColumnTitulo(),
              buildColumnSubtitulo(),
              // buildContainerAvatar(
              //   Avatar:
              //       'https://cdn6.campograndenews.com.br/uploads/noticias/2022/06/21/84jnw1cd8irs.jpeg',
              //   name: 'Aline Rafaela',
              //   desc: 'Desenvolvedora',
              //   avatar: null,
              // ),
              // buildContainerAvatar(
              //     Avatar:
              //         'https://i.pinimg.com/236x/a3/91/73/a391735ab77ae81791174667713bc75f.jpg',
              //     name: 'Anderson Cabral',
              //     desc: 'Desenvolvedor',
              //     avatar: null),
              // buildContainerAvatar(
              //     Avatar: 'https://pbs.twimg.com/media/FXY16QuX0AM5ijD.jpg',
              //     name: 'Thiago Natan',
              //     desc: 'Desenvolvedor e revisador de código',
              //     avatar: null),
              // buildContainerAvatar(
              //     Avatar:
              //         'https://cdn.vox-cdn.com/thumbor/RK0wEhiv4OeVIK4esVZ7mdB-nnw=/0x0:1280x720/920x613/filters:focal(538x258:742x462):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/58547333/ugandan_knuckles.0.jpg',
              //     name: 'Viviam Beatriz',
              //     desc: 'Desenvolvedora e designer',
              //     avatar: null),
              buildContainerFoundersPage(),
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            child: buildContainerFooter(),
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: const Color.fromRGBO(226, 248, 243, 1),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  buildColumnTitulo() {
    return Column(
      children: const [
        SizedBox(height: 50),
        Text(
          'Fundadores',
          style: TextStyle(
            fontSize: 40,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  buildColumnSubtitulo() {
    return Column(
      children: const [
        SizedBox(height: 5),
        Text(
          'CONHEÇA O TIME QUE FUNDOU O HELP4PAWS',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black45,
          ),
        ),
      ],
    );
  }

  buildContainerAvatar({required avatar, required name, required desc}) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 35,
            backgroundImage: NetworkImage('$avatar'),
          ),
          Expanded(
            child: Text(
              '   $name \n\n      $desc', textAlign: TextAlign.justify,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  buildContainerFooter() {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
          color: Color.fromARGB(255, 204, 83, 131)),
      child: const Center(
          child: Icon(
        Icons.people,
        size: 50,
      )),
    );
  }

  buildContainerFoundersPage() {
    return FutureBuilder<List<Founder>>(
      future: futureList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var lista = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: lista.length,
            itemBuilder: (context, index) {
              return buildContainerAvatar(
                  avatar: lista[index].avatar,
                  name: lista[index].nome,
                  desc: lista[index].desc);
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

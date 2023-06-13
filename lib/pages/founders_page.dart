import 'package:flutter/material.dart';

class FoundersPage extends StatefulWidget {
  const FoundersPage({super.key});

  @override
  State<FoundersPage> createState() => _FoundersPageState();
}

class _FoundersPageState extends State<FoundersPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: buildAppBar(),
          body: Column(
            children: [
              buildColumnTitulo(),
              buildColumnSubtitulo(),
              buildContainerAvatar(
                avatar: 'https://cdn6.campograndenews.com.br/uploads/noticias/2022/06/21/84jnw1cd8irs.jpeg',
                name: 'Aline Rafaela',
                desc: 'Desenvolvedora'
              ),
              buildContainerAvatar(
                avatar: 'https://i.pinimg.com/236x/a3/91/73/a391735ab77ae81791174667713bc75f.jpg',
                name: 'Anderson Cabral',
                desc: 'Desenvolvedor'
              ),
              buildContainerAvatar(
                avatar: 'https://pbs.twimg.com/media/FXY16QuX0AM5ijD.jpg',
                name: 'Thiago Natan',
                desc: 'Desenvolvedor e revisador de código'
              ),
              buildContainerAvatar(
                avatar: 'https://cdn.vox-cdn.com/thumbor/RK0wEhiv4OeVIK4esVZ7mdB-nnw=/0x0:1280x720/920x613/filters:focal(538x258:742x462):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/58547333/ugandan_knuckles.0.jpg',
                name: 'Viviam Beatriz',
                desc: 'Desenvolvedora e designer'
              ),
          ],),
          bottomNavigationBar: BottomAppBar(
            child: buildContainerFooter(),
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(226, 248, 243, 1),
      leading: IconButton(
        icon: Icon(
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
      children: [
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
      children: [
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
    return Flexible(
      child: Container(
        alignment: Alignment.topCenter,
        margin: EdgeInsets.all(20),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage('$avatar')
                  ,
            ),
            Flexible(
              child: Text(
                    '   $name \n\n      $desc',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  buildContainerFooter() {
    return Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
            color: Color.fromARGB(255, 204, 83, 131)),
        child:  Center(child: Icon(Icons.people, size: 50,)),
        );
        
  }
}
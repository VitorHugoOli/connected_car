import 'package:connected_car/garagem/garagemPage.dart';
import 'package:connected_car/models/Garagem.dart';
import 'package:flutter/material.dart';

import 'garageRegisterPage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Garagem garagem1 = new Garagem(
      01, 'Casa', 'Vitor', 'Rua Aimara 318', 'YgUY899uH89');
  Garagem garagem2 = new Garagem(02, 'Casa na Praia', 'Thiago',
      'Rua Saturno 121', 'YgUY899uH89');
  Garagem garagem3 = new Garagem(
      03, 'Predio', 'Thiago', 'Rua Alem 10', 'YgUY899uH89');
  List<Garagem> listaGaragem = new List<Garagem>();
  bool mock = true;

  Widget _buildFloatButton() {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () async {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => garagemRegister()),
        );
        print("AUTH");
      },
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add, size: 36.0),
    );
  }

  Widget _buildCard(String garageName, String garageSubTitle, int garageUID) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 100, 0, 0.6),
        ),
        child: _buildBodyCard(garageName, garageSubTitle, garageUID),
      ),
    );
  }

  Widget _buildBodyCard(
      String garageName, String garageSubTitle, int garageUID) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 20.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: _buildProfileCarImage(),
      ),
      title: Text(
        garageName, //Nome Da Garagem
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Text(garageSubTitle, style: TextStyle(color: Colors.white))
          ////SubTitle Garagem
        ],
      ),
      trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => garagePage(nome: garageName,)),
        );
      },
    );
  }

  Widget _buildProfileCarImage() {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/garage.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(
          color: Colors.white,
          width: 1.0,
        ),
      ),
    );
  }

  Widget _buildListaCard(List<Garagem> lista) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return _buildCard(
            lista[index].nome, lista[index].endereco, lista[index].uid);
      },
    );
  }

  void mockTest(){
    if (mock){
      listaGaragem.add(garagem1);
      listaGaragem.add(garagem2);
      listaGaragem.add(garagem3);
      mock=false;
    }
  }

  @override
  Widget build(BuildContext context) {
    mockTest();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Lista de Garagens",
          style: TextStyle(
            fontFamily: 'GoogleSans',
            fontSize: 30,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        elevation: 0,
      ),
      body: Container(
        child: _buildListaCard(listaGaragem),
      ),
      floatingActionButton: _buildFloatButton(),
    );
  }
}

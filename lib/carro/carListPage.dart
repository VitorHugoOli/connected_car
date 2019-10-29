import 'package:connected_car/models/Carro.dart';
import 'package:flutter/material.dart';

import 'carPage.dart';
import 'carRegisterPage.dart';

class CarListPage extends StatefulWidget {
  @override
  _CarListPageState createState() => _CarListPageState();
}

class _CarListPageState extends State<CarListPage> {
  bool mock = true;
  Carros car = new Carros(
      01, 'Jucelino', 'vitor', 'Belina', 'HiOnIOh89Y77RFtyu', 12, 14);
  Carros car2 = new Carros(
      02, 'Alfred', 'Thiago', 'Palio 99', 'GgIUGibKJoiY97y786656', 22, 20);
  Carros car3 = new Carros(03, 'Jose', 'Thiago', 'Kombi', 'UJguyGUt6778olLMiyutf5', 2, 5);
  List<Carros> listaCarros = new List<Carros>();

  Widget _buildFloatButton() {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () async {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => carRegister()),
        );
      },
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add, size: 36.0),
    );
  }

  Widget _buildCard(String carName, String carSubTitle, int carUID) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 100, 0.6),
        ),
        child: _buildBodyCard(carName, carSubTitle, carUID),
      ),
    );
  }

  Widget _buildBodyCard(String carName, String carSubTitle, int carUID) {
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
        carName, //Nome Da Garagem
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Text("Dono: " + carSubTitle,
              style: TextStyle(color: Colors.white)) ////SubTitle Garagem
        ],
      ),
      trailing:
          Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => CarPage(nome: carName,)),
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
          image: AssetImage('assets/images/tesla.jpg'),
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

  Widget _buildListaCard(List<Carros> lista) {
    return ListView.builder(
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return _buildCard(
            lista[index].apelido, lista[index].proprietario, lista[0].uid);
      },
    );
  }

  void mockTest(){
    if (mock){
      listaCarros.add(car);
      listaCarros.add(car2);
      listaCarros.add(car3);
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
          "Lista de Carros",
          style: TextStyle( fontFamily: 'GoogleSans',
            fontSize: 35 ,
            color: Colors.black,
            fontWeight: FontWeight.bold,),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        elevation: 0,
      ),
      body: Container(
        child:_buildListaCard(listaCarros),
      ),
      floatingActionButton: _buildFloatButton(),
    );
  }
}



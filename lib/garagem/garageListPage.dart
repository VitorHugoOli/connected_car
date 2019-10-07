import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _buildFloatButton() {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () async {
        print("AUTH");
      },
      materialTapTargetSize: MaterialTapTargetSize.padded,
      backgroundColor: Colors.blue,
      child: const Icon(Icons.add, size: 36.0),
    );
  }

  Widget _buildCard(String garageName,String garageSubTitle,int garageUID) {
    return Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.6),
        ),
        child: _buildBodyCard(garageName,garageSubTitle,garageUID),
      ),
    );
  }

  Widget _buildBodyCard(String garageName,String garageSubTitle,int garageUID) {
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
          Text(garageSubTitle, style: TextStyle(color: Colors.white)) ////SubTitle Garagem
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        print(garageUID);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[SizedBox(height: 60.0), _buildCard("Nome da Garagem","Alguma coisa talvez",01)],
        ),
      ),
      floatingActionButton: _buildFloatButton(),
    );
  }
}

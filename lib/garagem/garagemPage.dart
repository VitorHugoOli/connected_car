
import 'package:connected_car/models/Carro.dart';
import 'package:flutter/material.dart';

class garagePage extends StatefulWidget {
  garagePage({Key key, this.nome}) : super(key: key);
  final String nome;
  @override
  _garagePageState createState() => _garagePageState();
}

class _garagePageState extends State<garagePage> {

  String _propriedade = "20 Meses";
  String _endereco = "Rua Saturno 121, Portal Do sol";
//  final List<Carros> _carros = ;
  final String _totalUsado = "100";
  final String _Casa = "Barroco do Judas";


  Widget _buildCoverImage(Size screenSize) {
    return Container(
      height: screenSize.height / 2.6,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/garage.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildFullName() {
    TextStyle _nameTextStyle = TextStyle(
      fontFamily: 'GoogleSans',
      color: Colors.black,
      fontSize: 28.0,
      fontWeight: FontWeight.w700,
    );

    return Text(
      widget.nome,
      style: _nameTextStyle,
    );
  }

  Widget _buildBio(BuildContext context, String Titulo, String Conteudo) {
    TextStyle conteudoTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.w400,
      //try changing weight to w500 if not thin
      fontStyle: FontStyle.italic,
      color: Color(0xFF799497),
      fontSize: 16.0,
    );

    TextStyle tituloTextStyle = TextStyle(
      fontFamily: 'Spectral',
      fontWeight: FontWeight.bold,
      //try changing weight to w500 if not thin
      color: Colors.black,
      fontSize: 16.0,
    );

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.all(8.0),
            child: Text(
              Titulo,
              textAlign: TextAlign.center,
              style: tituloTextStyle,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.all(8.0),
            child: Text(
              Conteudo,
              textAlign: TextAlign.center,
              style: conteudoTextStyle,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeparator(Size screenSize) {
    return Container(
      width: screenSize.width / 1.6,
      height: 2.0,
      color: Colors.black54,
      margin: EdgeInsets.only(top: 10.0),
    );
  }

  Widget _buildbuttonEdit(){
    return RaisedButton(
      onPressed: () {
//                        Navigator.pushReplacement(
//                          context,
//                          MaterialPageRoute(builder: (context) => Empty()),
//                        );
      },
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.4,
        height: 60,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.lightBlue,
              Colors.lightGreen,
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Center(
          child: const Text(
            'Edit',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _buildCoverImage(screenSize),
          SafeArea(
            child: Column(
              children: <Widget>[
                SizedBox(height: screenSize.height / 6.4),
                SizedBox(height: 140),
                _buildFullName(),
                SizedBox(height: 20),
                _buildBio(context, 'Proprietario', _propriedade),
                _buildSeparator(screenSize),
                _buildBio(context, 'Edereço', _endereco),
                _buildSeparator(screenSize),
                _buildBio(context, 'Casa', _Casa),
                _buildSeparator(screenSize),
//                _buildBio(context, 'Entradas', _carros),
//                _buildSeparator(screenSize),
                _buildBio(context, 'Total de Usos', _totalUsado),
                _buildSeparator(screenSize),
                SizedBox(height: 20),
                _buildbuttonEdit()

              ],
            ),
          ),
        ],
      ),
    );
  }
}

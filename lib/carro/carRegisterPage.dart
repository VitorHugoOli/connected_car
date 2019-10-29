import 'package:connected_car/service/loader.dart';
import 'package:flutter/material.dart';

class carRegister extends StatefulWidget {
  @override
  _carRegisterState createState() => _carRegisterState();
}

Widget _buildTextoTryConnect() {
  return Center(
    child: Text(
      "Conecte-se ao seu dispositivo garageSecure \n"
      "Em Seguida aproxime a faixa que será colocada em seu carro",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: 'GoogleSans',
        fontSize: 30,
        color: Colors.black54,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget _buildButtonCancel() {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: SizedBox(
      height: 38,
      width: 180,
      child: RaisedButton(
        child: (Text(
          "Cancel",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontFamily: 'GoogleSans'),
        )),
        color: Colors.red[500],
        onPressed: () {},
      ),
    ),
  );
}

Widget _buildButtonNext() {
  return Container(
    padding: EdgeInsets.only(left: 10, right: 10),
    child: SizedBox(
      height: 38,
      width: 180,
      child: RaisedButton(
        child: (Text(
          "Next",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontFamily: 'GoogleSans'),
        )),
        color: Colors.green[500],
        onPressed: () {},
      ),
    ),
  );
}

Widget _buildAllButtons() {
  return Container(
    padding: EdgeInsets.only(bottom: 30),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildButtonCancel(),
        _buildButtonNext(),
      ],
    ),
  );
}

class _carRegisterState extends State<carRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildTextoTryConnect(),
              SizedBox(height: 20),
              ColorLoader2(color1: Colors.redAccent,
              color2: Colors.deepPurple,
              color3: Colors.green,)
            ],
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: _buildAllButtons(),
          ),
        ],
      ),
    );
  }
}

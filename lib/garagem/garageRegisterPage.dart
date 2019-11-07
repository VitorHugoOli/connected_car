import 'package:connected_car/service/conexaoBlue.dart';
import 'package:connected_car/service/loader.dart';
import 'package:flutter/material.dart';

class garagemRegister extends StatefulWidget {
  @override
  _garagemRegisterState createState() => _garagemRegisterState();
}

int state = 0;
String _nameWifi;
String _passwordWifi;

Widget _buildTextoPasso1() {
  return Center(
    child: Text(
      "1°\n"
      "Conecte-se ao seu dispositivo garageSecure a energia \n",
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

Widget _buildTextoPasso2() {
  return Center(
    child: Text(
      "2°\n"
      "Certifique-se que seu dispositivo \n"
      "esteja com o brucutu ligado",
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

// Passo 3
Widget _buildTextoPasso3() {
  return Center(
    child: Text(
      "3°\n"
      "Digite as informaçoes a seguir \n",
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

Widget _showNameInput() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10.0, 20.0, 5.0, 0.0),
    child: new TextFormField(
      style: TextStyle(color: Colors.black54),
      cursorColor: Colors.black54,
      maxLines: 1,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Nome Wi-Fi',
          hintStyle: TextStyle(color: Colors.black54),
          icon: new Icon(
            Icons.wifi,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'Wi-Fi can\'t be empty' : null,
      onSaved: (value) => _nameWifi = value.trim(),
    ),
  );
}

Widget _showPasswordInput() {
  return Padding(
    padding: const EdgeInsets.fromLTRB(10.0, 50.0, 5.0, 0.0),
    child: new TextFormField(
      style: TextStyle(color: Colors.black54),
      cursorColor: Colors.black54,
      maxLines: 1,
      obscureText: true,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: new InputDecoration(
          hintText: 'Senha Wi-Fi',
          hintStyle: TextStyle(color: Colors.black54),
          icon: new Icon(
            Icons.security,
            color: Colors.grey,
          )),
      validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
      onSaved: (value) => _passwordWifi = value.trim(),
    ),
  );
}

Widget _buildPasso3() {
  return Column(
    children: <Widget>[
      _buildTextoPasso3(),
      _showNameInput(),
      _showPasswordInput()
    ],
  );
}

//Passo 4
Widget _buildTextoPasso4() {
  return Center(
    child: Text(
      "4°\n"
      "Espere alguns segundos até nos\n"
      "conectarmos com o seu garageSecure",
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

Widget _buildPasso4() {
  ConexaoBlue blue = new ConexaoBlue(_passwordWifi,_nameWifi);
  return Column(
    children: <Widget>[
      _buildTextoPasso4(),
      SizedBox(height: 40),
      ColorLoader2(
        color1: Colors.blue,
        color2: Colors.deepPurple,
        color3: Colors.indigoAccent,
      ),
    ],
  );
}

Widget _buildBody() {
  if (state == 0) {
    return Column(
      children: <Widget>[
        _buildTextoPasso1(),
        _buildTextoPasso2(),
      ],
    );
  } else if (state == 1) {
    return Column(
      children: <Widget>[
        _buildPasso3(),
      ],
    );
  } else if (state == 2) {
    return Column(
      children: <Widget>[
        _buildPasso4(),
      ],
    );
  }
}

_ConnectBlutooth(){

}

class _garagemRegisterState extends State<garagemRegister> {
  Widget _buildAllButtons() {
//    return Container(
//      padding: EdgeInsets.only(bottom: 30),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          state == 0 ? _buildButtonCancel() : _buildButtonBack(),
//          _buildButtonNext(),
//        ],
//      ),
//    );
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
          onPressed: () {
            print("humm");
//            super.dispose();
          },
        ),
      ),
    );
  }

  Widget _buildButtonBack() {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        height: 38,
        width: 180,
        child: RaisedButton(
          child: (Text(
            "voltar",
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: 'GoogleSans'),
          )),
          color: Colors.blueAccent,
          onPressed: () {
            state--;
            setState(() {});
          },
        ),
      ),
    );
  }

  Widget _buildButtonNext() {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 10),
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
          onPressed: () {
            if (state == 0) {
              state++;
            } else if (state == 1) {
              state++;

            }
            setState(() {});
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            state == 0 ? _buildButtonCancel() : _buildButtonBack(),
            _buildButtonNext(),
          ],
        )
      ],
      body: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildBody(),
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

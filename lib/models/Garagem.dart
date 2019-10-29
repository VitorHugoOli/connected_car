import 'package:connected_car/models/Carro.dart';

class Garagem {
  int _uid;
  String _nome;
  String _proprietario;
  String _endereco;
  String _PLACAID;
  List<Carros> listaUltimosCarros = new List<Carros>();

  Garagem(this._uid, this._nome,this._proprietario, this._endereco, this._PLACAID);


  String get nome => _nome;

  set nome(String value) {
    _nome = value;
  }

  String get PLACAID => _PLACAID;

  set PLACAID(String value) {
    _PLACAID = value;
  }

  String get endereco => _endereco;

  set endereco(String value) {
    _endereco = value;
  }

  String get proprietario => _proprietario;

  set proprietario(String value) {
    _proprietario = value;
  }

  int get uid => _uid;

  set uid(int value) {
    _uid = value;
  }


}
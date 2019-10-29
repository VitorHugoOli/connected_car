class Carros {
  int _uid;
  String _apelido;
  String _proprietario;
  String _modelo;
  String _RFID;
  int _entradas;
  int _saidas;

  Carros(this._uid, this._apelido, this._proprietario, this._modelo, this._RFID,
      this._entradas, this._saidas);

  int get saidas => _saidas;

  set saidas(int value) {
    _saidas = value;
  }

  int get entradas => _entradas;

  set entradas(int value) {
    _entradas = value;
  }

  String get RFID => _RFID;

  set RFID(String value) {
    _RFID = value;
  }

  String get modelo => _modelo;

  set modelo(String value) {
    _modelo = value;
  }

  String get proprietario => _proprietario;

  set proprietario(String value) {
    _proprietario = value;
  }

  String get apelido => _apelido;

  set apelido(String value) {
    _apelido = value;
  }

  int get uid => _uid;

  set uid(int value) {
    _uid = value;
  }
}
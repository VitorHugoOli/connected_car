import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

class ConexaoBlue {
  String senha = "";
  String nomeRede = "";
  FlutterBlue flutterBlue = FlutterBlue.instance;
  BluetoothDevice devicer;
  BluetoothCharacteristic char;

  var _cotrollerSenha = TextEditingController();


  ConexaoBlue(this.senha, this.nomeRede)  {
    Run();
  }

  Run() async {
    await scanAndConnect();
    devicer.connect();
    await scanCharacteristics();
    await enviar(nomeRede,senha);
  }

  Future scanAndConnect() async {
    flutterBlue
        .scan(scanMode: ScanMode.balanced, timeout: Duration(seconds: 2))
        .listen((scanResult) {
      // do something with scan result
      BluetoothDevice device = scanResult.device;
      if (device.name == 'ESP32_GarageSecure') {
        devicer = device;
        print("Step 0 - Achou Despositivo");
      }
    });
  }

  void scanCharacteristics() async {
    List<BluetoothService> services = await devicer.discoverServices();
    services.forEach((service) async {
      var characteristics = service.characteristics;
      for (BluetoothCharacteristic c in characteristics) {
        print(c.uuid.toString());
        if (c.uuid.toString() == 'beb5483e-36e1-4688-b7f5-ea07361b26a8') {
          char = c;
          print('Step 1 - Conectou a caracteristica do BlueTooth');
        }
      }
    });
  }

  enviar(nomeRede,senha) async {
    print("set 2 - Começou o envia dos dados ");
    for (var o in _cotrollerSenha.text.split('')){
      await char.write([o.codeUnitAt(0)], withoutResponse: true);
    }
    print("step 3 - Em tese terminou o envio dos dados");
  }

}

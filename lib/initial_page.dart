import 'dart:convert';

import 'package:connected_car/usuario/userSignPage.dart';
import 'package:connected_car/pageController.dart';
import 'package:connected_car/usuario/userHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  bool isLoggedIn = false;
  var prof = "";

  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
    setState(() {
      this.isLoggedIn = isLoggedIn;
    });
  }

  void initiateFacebookLogin() async {
    var facebookLogin = FacebookLogin();
    var facebookLoginResult =
        await facebookLogin.logInWithReadPermissions(['email']);
    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        print("Error");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print("CancelledByUser");
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        print("LoggedIn");

        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookLoginResult.accessToken.token}');

        var profile = json.decode(graphResponse.body);
        prof = profile.toString();

        print(profile.toString());

        onLoginStatusChanged(true, profileData: profile);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/initial.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
            ),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 200.0,
              ),
              Center(
                child: Text(
                  "Bem Vindo\n ao Car Connect",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'GoogleSans',
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 100.0,
              ),
              Container(
                child: SizedBox(
                  height: 38,
                  width: 212,
                  child: RaisedButton(
                    child: (Text(
                      "Login in | Cadastro",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontFamily: 'GoogleSans'),
                    )),
                    color: Colors.blueGrey[500],
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => LoginSignUpPage()),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                child: SizedBox(
                  child: isLoggedIn
                      ? Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ControladorPagina()),
                        )
                      : RaisedButton(
                          child: (Text(
                            "Login with Facebook",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontFamily: 'GoogleSans'),
                          )),
                          color: Colors.blue,
                          onPressed: () => initiateFacebookLogin(),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

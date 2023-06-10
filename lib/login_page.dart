import 'package:flutter/material.dart';
import 'package:sourcecode/beranda.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _main(),
    );
  }

  Widget _main() {
    return Stack(
      children: [_bg(), _text(), _buton()],
    );
  }

  Widget _bg() {
    return Container(
      width: 1080,
      height: 1920,
      child: Image(
        image: AssetImage("images/bekgron.png"),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _text() {
    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Laporkan!!!!",
            style: TextStyle(fontSize: 30),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 8),
            child: Text(
              "Jangan Tunggu, Viral Dulu",
              style: TextStyle(fontSize: 27),
            ),
          ),
          Text(
            "Laporkan keluhanmu, agar cepat di tindak lanjuti",
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buton() {
    return Align(
        alignment: Alignment(0, 0.8),
        child: SizedBox(
          width: 200,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Beranda();
              }));
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                shape: StadiumBorder()),
            child: Text(
              "LAPORKAN SEKARANG",
              style: TextStyle(fontSize: 11),
            ),
          ),
        ));
  }
}

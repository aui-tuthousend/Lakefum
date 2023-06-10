// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sourcecode/submit.dart';

class Beranda extends StatefulWidget {
  const Beranda({Key? key}) : super(key: key);

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  File? image;
  String? description;



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Beranda"),
        ),
        body: _main(),
      ),
    );
  }

  Widget _main() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _card(),
          _txtTop(),
          _listLaporan(),
        ],
      ),
    );
  }

  Widget _card() {
    return Container(
      padding: EdgeInsets.all(10),
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          final result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormSubmissionPage();
          }));

          if (result != null) {
            final image = result['image'];
            final description = result['description'];

            setState(() {
              this.image = image;
              this.description = description;
            });

          }
        },
        child: Text(
          " + Tambah Laporan",
          style: TextStyle(fontSize: 11),
        ),
      ),
    );
  }

  Widget _txtTop() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Aduan Terbaru",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
        ),
        Text(
            "Lihat semua >",
            style: TextStyle(fontSize: 13)
        ),
      ],
    );
  }

  Widget _listLaporan(){
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          if (image != null)
            Image.file(
              image!,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),

          SizedBox(height: 10),
          Text(
            description ?? 'belum ada laporan :D',
            style: TextStyle(fontSize: 16,),
          ),
        ],
      ),
    );
  }
}

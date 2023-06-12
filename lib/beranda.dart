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
  String? judul;
  String? description;
  String? alamat;



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
            final judul = result['judul'];
            final description = result['description'];
            final alamat = result['alamat'];

            setState(() {
              this.image = image;
              this.judul = judul;
              this.description = description;
              this.alamat = alamat;
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
              width: MediaQuery.of(context).size.width,
              height: 150,
              fit: BoxFit.cover,
            ),

          SizedBox(height: 10),
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.only(left: 6),
            child: Text(
              description ?? 'belum ada laporan :D',
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

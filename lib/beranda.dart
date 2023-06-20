// import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sourcecode/submit.dart';
import 'other_file.dart';

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
          title: const Text("Beranda"),
        ),
        body: _main(),
      ),
    );
  }

  Widget _main() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _card(),
          _txtTop(),
          const SizedBox(height: 7),
          _listLaporan(),
        ],
      ),
    );
  }

  Widget _card() {
    return Container(
      padding: const EdgeInsets.all(10),
      width: 150,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          final result = await Navigator.push(context,
              MaterialPageRoute(builder: (context) {
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

            OtherClass().useImage(image!);
          }
        },
        child: const Text(
          " + Tambah Laporan",
          style: TextStyle(fontSize: 11),
        ),
      ),
    );
  }

  Widget _txtTop() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Aduan Terbaru",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        Text("Lihat semua >", style: TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget _listLaporan() {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<dynamic>(
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: EdgeInsets.all(10),
              height: 900,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.file(
                    image!,
                    width: MediaQuery.of(context).size.width,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 5,),
                  Text(judul ?? ''),
                  SizedBox(height: 5,),
                  Text(description ?? ''),
                  SizedBox(height: 5,),
                  Text(alamat ?? ''),
                  SizedBox(height: 20,),
                  ElevatedButton(
                    child: const Text('Close'),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Column(
        children: [
          if (image == null) const Text(" belum ada Laporan"),
          if (image != null)
            Container(
              width: MediaQuery.of(context).size.width,
              height: 210,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.cyan),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.file(
                      image!,
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.topLeft,
                    padding: const EdgeInsets.only(left: 6),
                    child: Text(
                      judul ?? '',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

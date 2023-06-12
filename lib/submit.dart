import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
// import "package:path_provider/path_provider.dart";
// import 'package:path/path.dart';

File? _image;

class FormSubmissionPage extends StatefulWidget {
  @override
  _FormSubmissionPageState createState() => _FormSubmissionPageState();
}

class _FormSubmissionPageState extends State<FormSubmissionPage> {
  final picker = ImagePicker();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _judulController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();

  Future<void> getImage() async {

    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Submit Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: getImage,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: _image != null
                    ? Image.file(_image!)
                    : Icon(Icons.add_a_photo, color: Colors.grey),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _judulController,
              decoration: InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Deskripsi'),
            ),
            TextField(
              controller: _alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, {
                  'image': _image != null ? File(_image!.path) : null,
                  'judul': _judulController.text,
                  'description': _descriptionController.text,
                  'alamat': _alamatController.text,

                });
                _image = null;
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}


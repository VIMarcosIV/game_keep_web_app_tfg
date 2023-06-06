import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as fb;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class DataInsertion_Page extends StatefulWidget {
  const DataInsertion_Page({Key? key}) : super(key: key);

  @override
  State<DataInsertion_Page> createState() => _DataInsertion_PageState();
}

class _DataInsertion_PageState extends State<DataInsertion_Page> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  html.File? _selectedImage;

  void _selectImage() async {
    final html.InputElement? input =
        html.document.createElement('input') as html.InputElement?;
    input!.type = 'file';
    input.accept = 'image/*';
    input.click();
    input.onChange.listen((e) {
      final List<html.File>? files = input.files;
      if (files != null && files.length > 0) {
        setState(() {
          _selectedImage = files[0];
        });
      }
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final String title = _titleController.text;

      // Guardar la imagen en Firebase Storage
      try {
        final firebase_storage.Reference storageRef =
            firebase_storage.FirebaseStorage.instance.ref().child('posters');
        final firebase_storage.UploadTask uploadTask =
            storageRef.child(_selectedImage!.name).putBlob(_selectedImage!);

        final firebase_storage.TaskSnapshot taskSnapshot =
            await uploadTask.whenComplete(() => null);

        final String imageURL = await taskSnapshot.ref.getDownloadURL();

        // Guardar los datos en Firestore
        await fb.FirebaseFirestore.instance
            .collection('videojuegos')
            .add({'title': title, 'poster': imageURL});

        // Restablecer el formulario
        _formKey.currentState!.reset();
        _titleController.clear();
        setState(() {
          _selectedImage = null;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Datos guardados en Firestore y la imagen en Firebase Storage'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al guardar los datos'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inserta los datos'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Título',
                  hoverColor: Colors.white,
                  fillColor: Colors.white,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Por favor, introduce un título';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _selectImage,
                child: Text('Seleccionar imagen'),
              ),
              SizedBox(height: 16.0),
              if (_selectedImage != null)
                Image.network(
                  html.Url.createObjectUrl(_selectedImage!),
                  height: 200.0,
                ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Guardar datos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

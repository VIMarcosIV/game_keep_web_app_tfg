import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataInsertion_Page extends StatefulWidget {
  const DataInsertion_Page({Key? key}) : super(key: key);

  @override
  State<DataInsertion_Page> createState() => _DataInsertion_PageState();
}

class _DataInsertion_PageState extends State<DataInsertion_Page> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  XFile? _selectedImage;
  final picker = ImagePicker();

  Future<void> _selectImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _selectedImage = pickedImage;
    });
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // Guardar los datos en Firestore
      final String title = _titleController.text;

      try {
        await FirebaseFirestore.instance.collection('videojuegos').add({
          'title': title,
        });

        // Restablecer el formulario
        _formKey.currentState!.reset();
        _titleController.clear();
        setState(() {
          _selectedImage = null;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Datos guardados en Firestore'),
            backgroundColor: Colors.green,
          ),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error al guardar los datos en Firestore'),
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
        title: Text('Insertar datos'),
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
                Image.file(
                  File(_selectedImage!.path),
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

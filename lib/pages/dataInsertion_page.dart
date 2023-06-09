import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;

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
        await cloud_firestore.FirebaseFirestore.instance
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

  Future<void> _confirmDeleteDialog(
      cloud_firestore.DocumentSnapshot videojuego) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xFF1E1E1E),
          title: const Text('Confirmar eliminación',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text(
                  '¿Estás seguro de eliminar este elemento?',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:
                  const Text('Cancelar', style: TextStyle(color: Colors.white)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                'Eliminar',
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              onPressed: () async {
                // Eliminar el elemento de Firestore
                await videojuego.reference.delete();

                Navigator.of(context).pop();

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Elemento eliminado'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Herramienta de administración'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Card(
                      color: Colors.white.withOpacity(0.05),
                      child: Padding(
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
                                  labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  fillColor: Colors.white,
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  hintStyle: TextStyle(color: Colors.blue[200]),
                                ),
                                style: TextStyle(color: Colors.blue[300]),
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
                                child: Text(
                                  'Seleccionar imagen',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
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
                                child: Text(
                                  'Guardar datos',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(231, 25, 31, 0.86),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      color: Colors.white.withOpacity(0.05),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              'Número de elementos encontrados:',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            StreamBuilder<cloud_firestore.QuerySnapshot>(
                              stream: cloud_firestore.FirebaseFirestore.instance
                                  .collection('videojuegos')
                                  .snapshots(),
                              builder: (context, snapshot) {
                                if (!snapshot.hasData) {
                                  return SpinKitFadingCircle(
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return DecoratedBox(
                                        decoration: BoxDecoration(
                                          color: index.isEven
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      );
                                    },
                                  );
                                }
                                int itemCount = snapshot.data!.docs.length;
                                return Text(
                                  'Videojuegos almacenados: $itemCount',
                                  style: TextStyle(
                                    color: Colors.blue[300],
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: 14),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Game",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 80,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "Keep",
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 80,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.yellow,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "Web",
                            style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.w900,
                              color: Colors.blue[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 16.0),
            Expanded(
              child: Card(
                color: Colors.white.withOpacity(0.05),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    // Added SingleChildScrollView widget
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 16.0),
                        StreamBuilder<cloud_firestore.QuerySnapshot>(
                          stream: cloud_firestore.FirebaseFirestore.instance
                              .collection('videojuegos')
                              .snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              final videojuegos = snapshot.data!.docs;
                              return GridView.builder(
                                shrinkWrap: true,
                                physics:
                                    NeverScrollableScrollPhysics(), // Disable GridView scrolling
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  crossAxisSpacing: 16.0,
                                  mainAxisSpacing: 16.0,
                                ),
                                itemCount: videojuegos.length,
                                itemBuilder: (context, index) {
                                  final videojuego = videojuegos[index];
                                  final title = videojuego['title'];
                                  final posterURL =
                                      videojuego['poster'] as String;

                                  return GestureDetector(
                                    onTap: () => _confirmDeleteDialog(
                                        videojuego), // Llamar al método _confirmDeleteDialog
                                    child: Card(
                                      color: Colors.white.withOpacity(0.1),
                                      child: Column(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12)),
                                            child: Image.network(
                                              posterURL,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          SizedBox(height: 8.0),
                                          Text(
                                            title,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text('Error al cargar los datos');
                            } else {
                              return SpinKitFadingCircle(
                                itemBuilder: (BuildContext context, int index) {
                                  return DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: index.isEven
                                          ? Colors.black
                                          : Colors.grey,
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

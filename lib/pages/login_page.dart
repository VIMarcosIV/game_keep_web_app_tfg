import 'package:Game_Keep_Web_Admin_Site/pages/unauthorized_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'dataInsertion_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthProvider>(context);
    return Consumer<AuthProvider>(
      builder: (context, model, _) {
        return StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              // Usuario no autenticado
              return Scaffold(
                body: LayoutBuilder(
                  builder: (context, constraints) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Image.asset("assets/images/logo.png",
                                        scale: 8),
                                    SizedBox(
                                      height: 14,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Game",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "Keep",
                                          style: TextStyle(
                                            fontStyle: FontStyle.italic,
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "Web",
                                      style: TextStyle(
                                        fontSize: 40,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.blue[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              Container(
                                width: 400,
                                child: SingleChildScrollView(
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      minHeight: constraints.maxHeight,
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(15.0),
                                      child: Card(
                                        color: Colors.white.withOpacity(0.05),
                                        child: Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                child: TextField(
                                                  controller:
                                                      provider.emailController,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors
                                                          .white), // Color del texto
                                                  cursorColor: Colors
                                                      .teal, // Color del cursor
                                                  decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                        Icons.email,
                                                        color: Colors
                                                            .white), // Color del icono
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .white), // Color del subrayado cuando no está seleccionado
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .white), // Color del subrayado cuando está seleccionado
                                                    ),
                                                    hintText:
                                                        'Correo Electrónico',
                                                    hintStyle: TextStyle(
                                                        color: Colors
                                                            .white70), // Color del texto de sugerencia
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              SizedBox(
                                                height: 40,
                                                child: TextField(
                                                  controller: provider
                                                      .passwordController,
                                                  obscureText: true,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      color: Colors
                                                          .white), // Color del texto
                                                  cursorColor: Colors
                                                      .teal, // Color del cursor
                                                  decoration: InputDecoration(
                                                    prefixIcon: Icon(
                                                        Icons.password,
                                                        color: Colors
                                                            .white), // Color del icono
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .white), // Color del subrayado cuando no está seleccionado
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .white), // Color del subrayado cuando está seleccionado
                                                    ),
                                                    hintText: 'Contraseña',
                                                    hintStyle: TextStyle(
                                                        color: Colors
                                                            .white70), // Color del texto de sugerencia
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Container(
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    provider
                                                        .logearUsuario(context);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Entrar',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Container(
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    provider.registrarUsuario(
                                                        context);
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Color.fromRGBO(
                                                            231, 25, 31, 0.86),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                  child: Text(
                                                    'Registrarse',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            } else {
              return _buildAuthStateWidget(context);
            }
          },
        );
      },
    );
  }

  Widget _buildAuthStateWidget(BuildContext context) {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('roles').doc(uid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Esperando la obtención del documento de Firestore
          return Container(
            color: Color(0xFF1E1E1E), // Establecer el color de fondo
            child: SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    color: index.isEven ? Colors.black : Colors.grey,
                  ),
                );
              },
            ),
          );
        } else if (snapshot.hasError) {
          // Error al obtener el documento de Firestore
          return Text('Error al obtener el documento');
        } else {
          final userDoc = snapshot.data;
          if (userDoc?.exists == true) {
            final userData = userDoc?.data() as Map<String, dynamic>?;

            final userRole = userData?['role'];
            if (userRole == 'admin') {
              return DataInsertion_Page();
            } else {
              return UnauthorizedScreen();
            }
          } else {
            return UnauthorizedScreen();
          }
        }
      },
    );
  }
}

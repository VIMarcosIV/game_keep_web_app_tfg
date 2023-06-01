import 'package:flutter/material.dart';
import 'package:flutter_tfg_web/pages/login_page.dart';
import '../themes/custom_theme.dart';

class UnauthorizedScreen extends StatelessWidget {
  const UnauthorizedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data:
          customTheme, // Importar el tema personalizado desde el archivo custom_theme.dart
      child: Scaffold(
        appBar: AppBar(
          title: Text('Acceso denegado'),
        ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No tienes los privilegios necesarios, reinicia e intentalo nuevamente con una cuenta válida',
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      ?.copyWith(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
                  'La cuenta utilizada no posee los privilegios necesarios, reinicia la aplicación intentalo nuevamente con una cuenta válida',
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

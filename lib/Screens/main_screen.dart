import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:walking_petz/Screens/login_screen.dart';

class mainScreen extends StatefulWidget {
  const mainScreen({super.key});

  @override
  State<mainScreen> createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> {

  //Funcion para cerrar sesion
  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();

    // Redirige a la pantalla de login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  void initState() {super.initState();
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      // El usuario ha cerrado sesión
      print('Usuario ha cerrado sesión');
      // Puedes redirigir al usuario a la pantalla de login o mostrar un mensaje
    } else {
      // El usuario ha iniciado sesión
      print('Usuario ha iniciado sesión');
    }
  });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
        actions: [
          IconButton(
            onPressed: _signOut, // Llama a la función para cerrar sesión
            icon: const Icon(Icons.logout),
          ),],
      ),
      body: const Center(
        child: Text("Pantalla principal"),
      ),
    );
  }
}


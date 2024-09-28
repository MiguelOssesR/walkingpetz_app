import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:walking_petz/Screens/login_screen.dart';
import 'package:walking_petz/Screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const WalkingPetz());
}

class WalkingPetz extends StatefulWidget {
  const WalkingPetz({Key? key}) : super(key: key);

  @override
  State<WalkingPetz> createState() => _WalkingPetzState();
}

class _WalkingPetzState extends State<WalkingPetz> {
  Widget? _initialScreen;

  @override
  void initState() {
    super.initState();
    _checkAuthState();
  }

  Future<void> _checkAuthState() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      // El usuario ha iniciado sesión, redirigir a main_screen
      setState(() {
        _initialScreen = const mainScreen();
      });
    } else {
      // El usuario no ha iniciado sesión, mostrar la pantalla de login
      setState(() {
        _initialScreen = const Login();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Walking Petz Paseo de Mascotas",
      home: _initialScreen, // Mostrar la pantalla inicial según el estado de autenticación
    );
  }
}

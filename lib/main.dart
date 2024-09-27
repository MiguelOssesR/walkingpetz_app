import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:walking_petz/Screens/login_screen.dart';

void main() async {
  // Inicializar Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const WalkingPetz());
}

class WalkingPetz extends StatelessWidget {
  const WalkingPetz({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Walking Petz Paseo de Mascotas",
      home: Login(),
    );
  }
}

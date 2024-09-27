import 'package:flutter/material.dart';
import 'package:walking_petz/Services/authentication.dart';


class Singup extends StatefulWidget {
  const Singup({super.key});

  @override
  State<Singup> createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  // Controladores para los campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Instancia del servicio de autenticación
  final AuthServices _authServices = AuthServices();

  // Función para registrar al usuario
  void _signUpUser() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Llamar a la función de registro
    String res = await _authServices.signUpUser(
      email: email,
      password: password,
    );

    // Mostrar un mensaje en consola o en la UI
    print(res);

    // Puedes usar un SnackBar para mostrar el mensaje al usuario
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(res)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Usuario'),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(hintText: 'Contraseña'),
              obscureText: true,
            ),
            const SizedBox(height: 32.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _signUpUser,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Registrar nuevo usuario',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


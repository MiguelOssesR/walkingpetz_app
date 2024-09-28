import 'package:flutter/material.dart';
import 'package:walking_petz/Services/authentication.dart';
import 'package:walking_petz/Screens/singUp_screen.dart';
import 'package:walking_petz/Screens/main_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Controladores para los campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // Instancia del servicio de autenticación
  final AuthServices _authServices = AuthServices();

  // Función para iniciar sesión del usuario
  void _signInUser() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Llamar a la función de inicio de sesión
    String res = await _authServices.signInUser(
      email: email,
      password: password,
    );

    // Mostrar un mensaje en consola o en la UI
    print(res);

    // Puedes usar un SnackBar para mostrar el mensaje al usuario
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(res)),
    );

    if (res == "Usuario autenticado correctamente") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const mainScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Walking Petz',
          style: TextStyle(
            color: Color.fromARGB(255, 161, 161, 161),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          //Imagen Logo
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/welcome_screen_pic.webp'),
              ),
            ),
            height: 200, // Altura de la imagen
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              children: [
                // InputText Usuario
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Color del borde
                      width: 2.0, // Ancho del borde
                    ),
                  ),
                  child: TextField(
                    controller: _emailController, // Añadir el controlador
                    decoration: const InputDecoration(
                      hintText: 'Usuario',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15), // Padding interno del campo
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Espacio entre los campos

                // InputText Contraseña
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Color del borde
                      width: 2.0, // Ancho del borde
                    ),
                  ),
                  child: TextField(
                    controller: _passwordController, // Añadir el controlador
                    obscureText: true, // Oculta el texto de la contraseña
                    decoration: const InputDecoration(
                      hintText: 'Contraseña',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(15), // Padding interno del campo
                    ),
                  ),
                ),
                const SizedBox(height: 30), // Espacio antes del botón

                // Iniciar sesion con usuario
                SizedBox(
                  width: double.infinity, // Ancho del botón igual al contenedor
                  child: ElevatedButton(
                    onPressed: _signInUser, // Vincular la función de registro
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Iniciar Sesion Usuario',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 20), // Espacio entre el botón yel texto

                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Singup())); // <-- Paréntesis cerrado
                  },
                  child: const Text(
                    '¿No tienes una cuenta? Regístrate aquí',
                    style: TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

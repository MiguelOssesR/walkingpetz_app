import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:walking_petz/Services/authentication.dart';

void main() async {
  // Inicializar Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //Correr la app
  runApp(const WalkingPetz());
}

class WalkingPetz extends StatelessWidget {
  const WalkingPetz({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, // Quita la etiqueta "debug"
        title: "Walking Petz Paseo de Mascotas",
        home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
            height: 400, // Altura de la imagen
          ),
          const SizedBox(height: 80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80.0),
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

                // Registrar Usuario
                SizedBox(
                  width: double.infinity, // Ancho del botón igual al contenedor
                  child: ElevatedButton(
                    onPressed: _signUpUser, // Vincular la función de registro
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Registrar Usuario',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

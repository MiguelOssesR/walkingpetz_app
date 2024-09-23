import 'package:flutter/material.dart';

void main() => runApp(const WalkingPetz());

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

//Trabajar aquí la interfaz principal
class _HomeState extends State<Home> {
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

                //InputText Usuario
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Color del borde
                      width: 2.0, // Ancho del borde
                    ),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: 'Usuario',
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.all(15), // Padding interno del campo
                    ),
                  ),
                ),
                
                const SizedBox(height: 20), // Espacio entre los campos

                //InputText Contraseña
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey, // Color del borde
                      width: 2.0, // Ancho del borde
                    ),
                  ),
                  child: const TextField(
                    obscureText: true, // Oculta el texto de la contraseña
                    decoration: InputDecoration(
                      hintText: 'Contraseña',
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.all(15), // Padding interno del campo
                    ),
                  ),
                ),

                const SizedBox(height: 30), // Espacio antes del botón

                //Boton de Iniciar Sesion
                SizedBox(
                  width: double.infinity, // Ancho del botón igual al contenedor
                  child: ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Iniciar Sesion',
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

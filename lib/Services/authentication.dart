import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //Para Autenticación
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Login de usuario existente
  signInUser({required String email, required String password}) async {
    String res = "Ocurrió algún error";
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      res = "Usuario autenticado correctamente";
    } catch (e) {
      print(e.toString());
    }
    return res;
  }

  //Registro de nuevo usuario
  signUpUser({required String email, required String password}) async {
    String res = "Ocurrió algún error";
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      res = "Usuario registrado correctamente";

    } catch (e) {
      print(e.toString());
    }
    return res;
  }
}

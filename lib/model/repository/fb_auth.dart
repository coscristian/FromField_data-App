import 'package:firebase_auth/firebase_auth.dart';

// Hablar con Firebase en el modulo autenticación
class FirebaseAuthenticationRepository {
  /*

    Formas de manejar métodos asincronos:
      1. Async - Await ->
      2. Future = Promesas(JS) -> Valores que en llegarán en un futuro.
   
  */
  Future<void> createEmailPasswordAccount(String email, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return Future.error('La clave es muy facil de adivinar.');
      } else if (e.code == 'email-already-in-use') {
        return Future.error('Ya existe una cuenta con ese correo');
      }
    }
  }

  Future<void> signInEmailPassword(String email, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Future.error('Usuario no existe.');
      } else if (e.code == 'wrong-password') {
        return Future.error('Credenciales invalidas');
      }
    }
  }
}

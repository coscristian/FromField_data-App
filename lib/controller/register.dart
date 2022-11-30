import '../model/entity/user.dart';
import '../model/repository/fb_auth.dart';
import '../model/repository/user.dart';
import 'request/register.dart';

class RegisterController {
  late final UserRepository _userRepository;
  late final FirebaseAuthenticationRepository _authRepository;
  RegisterController() {
    _userRepository = UserRepository();
    _authRepository = FirebaseAuthenticationRepository();
  }
/*
  void validateUser(RegisterRequest request) {
    var user = _userRepository.findByEmailToRegister(request.email);
    // TODO: Agregar el usuario a una BBDD, por el momento agregarlo al mapa
    UserEntity userToRegister = UserEntity(
      email: request.email,
      name: request.name,
      password: request.password,
      typeAcoount: request.typeAccount,
    );
    _userRepository.addUser(userToRegister);
  }
*/
  Future<void> registerNewUser(RegisterRequest request) async {
    // Capturo la excepción aquí ya que no lo estamos manejando con el .then()
    // Crear un correo/clave en Firebase Authentication
    await _authRepository.createEmailPasswordAccount(
        request.email, request.password);

    // Agregar información adicional en base de datos
    _userRepository.save(UserEntity(
        email: request.email,
        name: request.name,
        typeAccount: request.typeAccount));
  }
}

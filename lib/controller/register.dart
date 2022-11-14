import 'package:from_field_data/model/entity/user.dart';

import '../model/repository/user.dart';
import 'request/register.dart';

class RegisterController {
  late final UserRepository _userRepository;

  RegisterController() {
    _userRepository = UserRepository();
  }

  void validateUser(RegisterRequest request) {
    var user = _userRepository.findByEmailToRegister(request.email);
    // TODO: Agregar el usuario a una BBDD, por el momento agregarlo al mapa
    print("Hola3");
    UserEntity userToRegister = UserEntity(
      email: request.email,
      name: request
          .name, /*
      password: request.password,
      typeAcoount: request.typeAcoount,*/
    );
    print("Hola4");
    _userRepository.addUser(userToRegister);
    print("Hola Agregado");
  }
}
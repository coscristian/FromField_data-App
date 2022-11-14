import '../model/entity/user.dart';
import '../model/repository/user.dart';
import 'request/login.dart';

class LoginController {
  late final UserRepository _userRepository;

  LoginController() {
    _userRepository = UserRepository();
  }

  String validateEmailPassword(LoginRequest request) {
    var user = _userRepository.findByEmailToLogin(request.email);

    if (user.password != request.password) {
      throw Exception("Credenciales Incorrectas");
    }

    return user.name!;
  }

  String isUserRegistered(LoginRequest request) {
    var user = _userRepository.findByEmailToLogin(request.email);
    return user.email!;
  }
}

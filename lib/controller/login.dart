import '../model/repository/fb_auth.dart';
import '../model/repository/user.dart';
import 'request/login.dart';

class LoginController {
  late final UserRepository _userRepository;
  late final FirebaseAuthenticationRepository _authRepository;

  LoginController() {
    _userRepository = UserRepository();
    _authRepository = FirebaseAuthenticationRepository();
  }

  String isUserRegistered(LoginRequest request) {
    var user = _userRepository.findByEmailToLogin(request.email);
    return user.email!;
  }

  Future<void> validateEmailPassword(LoginRequest request) async {
    // Log in on Firebase Authentication
    await _authRepository.signInEmailPassword(request.email, request.password);
    print("Usuario Logeado: ${request.email} ${request.password}");
  }
}

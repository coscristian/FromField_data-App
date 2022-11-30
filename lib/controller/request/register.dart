import '../../model/entity/user_type_account.dart';

class RegisterRequest {
  late String email;
  late String name;
  late String password;
  late UserTypeAccount? typeAccount;

  @override
  String toString() {
    return "$name, $email, $password, $typeAccount";
  }
}

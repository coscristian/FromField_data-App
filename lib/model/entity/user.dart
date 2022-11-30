import 'user_type_account.dart';

class UserEntity {
  late String? name;
  late String? email;
  late String? password;
  late UserTypeAccount? typeAccount;

  UserEntity({
    this.name,
    this.email,
    this.password,
    this.typeAccount,
  });

  @override
  String toString() {
    return "UserEntity {$name, $email, $password, $typeAccount}";
  }
}

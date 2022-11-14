import 'user_type_account.dart';

class UserEntity {
  late String? name;
  late String? email;
  late String? password;
  late UserTypeAccount? typeAcoount;

  UserEntity({
    this.name,
    this.email,
    this.password,
    this.typeAcoount,
  });
}

import '../entity/user.dart';
import '../entity/user_type_account.dart';

class UserRepository {
  var _users = <String, UserEntity>{};

  UserRepository() {
    _users['crisquesadaco@gmail.com'] = UserEntity(
      name: "Cristian Quesada Cossio",
      email: "crisquesadaco@gmail.com",
      password: "Cris_123",
      typeAcoount: UserTypeAccount.institucional,
    );
    _users['andres@gmail.com'] = UserEntity(
      name: "Andres Loaiza Perez",
      email: "andres@gmail.com",
      password: "Andres12345",
      typeAcoount: UserTypeAccount.institucional,
    );
  }

  UserEntity findByEmailToLogin(String email) {
    var user = _users[email];

    if (user == null) {
      throw Exception("Usuario no existente");
    }
    return user;
  }

  UserEntity? findByEmailToRegister(String email) {
    var user = _users[email];
    if (user != null) {
      throw Exception("Ya hay un usuario con ese email.");
    }
    return null;
  }

  void addUser(UserEntity user) {
    _users[user.email!] = user;
  }
}

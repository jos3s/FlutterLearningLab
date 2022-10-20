import 'package:Lembretes_Flutterama/models/user.dart';

class Database {
  //Singleton
  static final Database _singleton = Database._internal();

  Database._internal();

  factory Database() {
    return _singleton;
  }

  List<User> users = [
    User(codigo: 1, nome: "Teste", email: "teste@gmail", senha: "123"),
  ];

  User? login(String email, String senha) {
    for (var user in users) {
      if (user.email == email && user.senha == senha) {
        return user;
      }
    }

    return null;
  }

  User? usuarioLogado;
}

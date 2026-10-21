class UserModel {
  String name;
  String email;
  String kelas;
  String jurusan;
  String password;

  UserModel({
    required this.name,
    required this.email,
    required this.kelas,
    required this.jurusan,
    required this.password,
  });
}

UserModel? registeredUser;
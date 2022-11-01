class Pengguna {
  String id = "";
  String? name;
  String username = "";
  String password = "";
  String? NomerTelpon;
  String get getId => this.id;

  set setId(String id) => this.id = id;

  get getName => this.name;

  set setName(name) => this.name = name;

  get getUsername => this.username;

  set setUsername(username) => this.username = username;

  get getPassword => this.password;

  set setPassword(password) => this.password = password;

  get getNomerTelpon => this.NomerTelpon;

  set setNomerTelpon(NomerTelpon) => this.NomerTelpon = NomerTelpon;

  Pengguna(
      {required String id,
      required String name,
      required String username,
      required String password,
      required String NomerTelpon}) {
        setId  = id;
        setName = name;
        setUsername = username;
        setPassword = password;
        setNomerTelpon = NomerTelpon;
      }
}

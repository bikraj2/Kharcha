// ignore_for_file: unnecessary_this

class Users {
  late String firstName, middleName, lastName, email, username, password;
  Users(String f, String m, String l, String e, String u, String p) {
    this.firstName = f;
    this.middleName = m;
    this.lastName = l;
    this.email = e;
    this.username = u;
    this.password = p;
  }
  Object value() {
    return {'firstName':firstName,'middleName':middleName,'lastName':lastName,'email':email,'username':username,'password':password};
  }
}

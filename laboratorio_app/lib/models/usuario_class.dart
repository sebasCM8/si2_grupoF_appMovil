class Usuario {
  String _ci;
  String _direccion;
  String _email;
  String _fechaNacimiento;
  int _id;
  String _nombre;
  String _telefono;

  String _username;
  String _password;

  Usuario(this._username, this._password, this._id, this._nombre, this._ci,
      this._direccion, this._email, this._telefono, this._fechaNacimiento);

  String getUsername() => this._username;

  Usuario.fromMap(Map<String, dynamic> map) {
    this._ci = map['id'];
    this._direccion = map['direccion'];
    this._email = map['email'];
    this._fechaNacimiento = map['fechaNacimiento'];
    this._id = map['id'];
    this._nombre = map['nombre'];
    this._telefono = map['telefono'];
  }
}

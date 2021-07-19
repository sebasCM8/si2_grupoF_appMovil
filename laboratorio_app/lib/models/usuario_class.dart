import 'dart:convert';
import 'package:http/http.dart' as http;

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

  Usuario.fromLogin(this._username, this._password);

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

  Map<String, dynamic> toMap(){
    Map<String, dynamic> mapa = {
      'username':this._username,
      'password': this._password
    };
    return mapa;
  }

  static Future<int> loginUser(Usuario user) async{
    final url = "https://laboratoriosi.andresmontano.website/api/login";
    Map<String, dynamic> mapa = user.toMap();
    var response = await http.post(url, body: {
      'username': mapa['username'],
      'password': mapa['password']
    });
    if(response.statusCode == 200){
      return 1;
    }else{
      return 0;
    }
  }
}

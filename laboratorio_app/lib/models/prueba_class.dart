import 'dart:convert';
import 'package:http/http.dart' as http;

class Prueba{

  int _id;
  String _name;
  String _desc;
  double _price;

  Prueba.fromAPI(Map<String, dynamic> item){
    this._id = item['id'];
    this._name = item['name'];
    this._desc = item['detail'];
    this._price = item['price'];
  }

  static Future<List> loadTests(String idCampania) async {
    String host = 'https://laboratoriosi.andresmontano.website/';

    var url = Uri.parse(host + 'api/tests/index/' + idCampania);
    var response = await http.get(url);
    
    const JsonDecoder decoder = const JsonDecoder();
    var json = decoder.convert(response.body);
    return json['data'];
  }
}
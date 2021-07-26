import 'package:flutter/material.dart';
import 'package:laboratorio_app/models/analisis_class.dart';
import 'package:laboratorio_app/models/usuario_class.dart';

class AnalisisPage extends StatefulWidget {
  final Usuario user;
  AnalisisPage({this.user});
  @override
  _AnalisisPageState createState() => _AnalisisPageState();
}

class _AnalisisPageState extends State<AnalisisPage> {
  Usuario _user;
  List _analisis = [];

  void _getAnalisis() {
    for (int i = 1; i < 21; i++) {
      Analisis ana = Analisis();
      ana.setId(i);
      ana.setEstado((i % 2 == 0) ? 1 : 0);
      _analisis.add(ana);
    }
  }

  @override
  void initState() {
    super.initState();
    _user = widget.user;
    _getAnalisis();
  }

  void _verAnalisis(Analisis ana) {
    /*print("hello");
    FacturaUsuario info = FacturaUsuario(_user, ana);
    Navigator.pushNamed(context, 'facturaDetallePage', arguments: info);*/
  }

  Widget _analisisCard(Analisis ana) {
    String estado = (ana.getEstado() == 1) ? "Terminado" : "En proceso";
    Color estadoColor = (ana.getEstado() == 1) ? Colors.green : Colors.orangeAccent;

    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.red,
              width: 1
            )
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: estadoColor),
              child: Icon(Icons.notification_important, color: Colors.white),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nombre: Analisis de sangre',
                      style: TextStyle(fontSize: 17)),
                  Row(
                    children: [
                      Text('Estado: ', style: TextStyle(fontSize: 17)),
                      Text(estado, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color:estadoColor))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        _verAnalisis(ana);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Analisis"),
      ),
      body: Container(
          padding: EdgeInsets.all(14),
          child: (_analisis.length == 0)
              ? Center(
                  child: Text("No tiene analisis disponibles"),
                )
              : ListView.builder(
                  itemCount: _analisis.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _analisisCard(_analisis[index]);
                  })),
    );
  }
}

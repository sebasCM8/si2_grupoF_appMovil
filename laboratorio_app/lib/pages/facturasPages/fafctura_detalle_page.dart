import 'package:flutter/material.dart';
import 'package:laboratorio_app/costum_widgets/generic_widgets.dart';
import 'package:laboratorio_app/models/factura_class.dart';
import 'package:laboratorio_app/models/usuario_class.dart';
import 'package:laboratorio_app/other_classes/facxuser_param.dart';

class FacturaDetallePage extends StatefulWidget {
  final FacturaUsuario info;
  FacturaDetallePage({this.info});
  @override
  _FacturaDetallePageState createState() => _FacturaDetallePageState();
}

class _FacturaDetallePageState extends State<FacturaDetallePage> {
  Factura _laFactura;
  Usuario _user;

  @override
  void initState() {
    super.initState();
    _laFactura = widget.info.fac;
    _user = widget.info.usu;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle factura"),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(padding: EdgeInsets.only(top: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    mediumText("Cliente: ", Colors.red[800]),
                    notableText(_user.getUsername(), Colors.black)
                  ],
                ),
                Column(
                  children: [
                    mediumText("NIT: ", Colors.red[800]),
                    notableText(_laFactura.getNit(), Colors.black)
                  ],
                ),
                Column(
                  children: [
                    mediumText("Total factura: ", Colors.red[800]),
                    notableText("${_laFactura.getPrecioNeto()}", Colors.black)
                  ],
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top:30, bottom: 10, left: 15, right: 15),
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(color: Colors.red, width: 3))),
              child: SizedBox(
                height: 3,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:10, left: 20),
              child: Row(
                children: [
                  mediumText("Nro factura: ", Colors.red[800]),
                  notableText("${_laFactura.getId()}", Colors.black)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:10, left: 20),
              child: Row(
                children: [
                  mediumText("Fecha: ", Colors.red[800]),
                  notableText(_laFactura.getFecha(), Colors.black)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:10, left: 20),
              child: Row(
                children: [
                  mediumText("Precio bruto: ", Colors.red[800]),
                  notableText("${_laFactura.getPrecioBruto()}", Colors.black)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:10, left: 20),
              child: Row(
                children: [
                  mediumText("Descuento: ", Colors.red[800]),
                  notableText("${_laFactura.getDescuento()}", Colors.black)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

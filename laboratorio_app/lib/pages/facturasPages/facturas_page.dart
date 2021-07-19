import 'package:flutter/material.dart';
import 'package:laboratorio_app/models/factura_class.dart';
import 'package:laboratorio_app/models/usuario_class.dart';

class FacturasPage extends StatefulWidget {
  final Usuario user;
  FacturasPage({this.user});
  @override
  _FacturasPageState createState() => _FacturasPageState();
}

class _FacturasPageState extends State<FacturasPage> {
  Usuario _user;
  List _facturas = [];

  void _getFacturas() {
    for (int i = 1; i < 6; i++) {
      Factura fac = Factura(i, 12.0, '19/07/2021', '77767$i', 1000, 950);
      _facturas.add(fac);
    }
  }

  @override
  void initState() {
    super.initState();
    _user = widget.user;
    _getFacturas();
  }

  Widget _facturaCard(Factura fac) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Card(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: Colors.redAccent,
            width: 1.5
          )),
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Text('${fac.getId()}'),
              Text('Nit: ${fac.getNit()}'),
              Text('Descuento: ${fac.getDescuento()}'),
              Text('Realizada el: ${fac.getFecha()}')
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mis Facturas"),
      ),
      body: Container(
          padding: EdgeInsets.all(14),
          child: (_facturas.length == 0)
              ? Center(
                  child: Text("No tiene facturas disponibles"),
                )
              : ListView.builder(
                  itemCount: _facturas.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _facturaCard(_facturas[index]);
                  })),
    );
  }
}

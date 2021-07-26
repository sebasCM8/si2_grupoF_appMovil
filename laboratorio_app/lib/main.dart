import 'package:flutter/material.dart';
import 'package:laboratorio_app/pages/analisisPages/analisis_page.dart';
import 'package:laboratorio_app/pages/campaign/campaignsPages.dart';
import 'package:laboratorio_app/pages/campaign/pruebaCampaniaPage.dart';
import 'package:laboratorio_app/pages/facturasPages/facturas_page.dart';
import 'package:laboratorio_app/pages/facturasPages/fafctura_detalle_page.dart';
import 'package:laboratorio_app/pages/home_page.dart';
import 'package:laboratorio_app/pages/login_pages/login_page.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:laboratorio_app/pages/menu_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home_page',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        'home_page': (context) => HomePage(),
        'login_page': (context) => LoginPage(),
        'menuPage':(context)=>MenuPage(user: ModalRoute.of(context).settings.arguments,),
        'facturasPage': (context)=>FacturasPage(user: ModalRoute.of(context).settings.arguments,),
        'facturaDetallePage': (context) => FacturaDetallePage(info: ModalRoute.of(context).settings.arguments,),
        'analisisPage': (context)=>AnalisisPage(user: ModalRoute.of(context).settings.arguments,),
        'campaignsPage': (context) => Campanias(id:ModalRoute.of(context).settings.arguments),
        'campaignTestsPage': (context) => Tests(idCampania: ModalRoute.of(context).settings.arguments)
      },
    );
  }
}
/*
class LaunchWidget extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Container(
              child: Center(child: Text("Error inesperado..")),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return HomePage();
          //Navigator.pushReplacementNamed(context, 'home_page');
        }
        return Scaffold(
          body: Container(
            child: Center(child: Text("Cargando..")),
          ),
        );
      },
    );
  }
}
*/
class Factura {
  int _id;
  double _descuento;
  String _fecha;
  String _nit;
  double _precioNeto;
  double _precioBruto;

  Factura(this._id, this._descuento, this._fecha, this._nit, this._precioBruto,
      this._precioNeto);
  Factura.froMap(Map<String, dynamic> mapa) {
    this._id = mapa['id'];
    this._descuento = mapa['descuento'];
    this._fecha = mapa['fecha'];
    this._nit = mapa['nit'];
    this._precioBruto = mapa['precioBruto'];
    this._precioNeto = mapa['precioNeto'];
  }

  int getId() => this._id;
  String getNit() => this._nit;
  double getDescuento() => this._descuento;
  String getFecha() => this._fecha;
  double getPrecioNeto() => this._precioNeto;
  double getPrecioBruto() => this._precioBruto;
}

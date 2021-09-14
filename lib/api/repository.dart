import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/resource.dart';

class Repository {
  final api = Resource();

  Future<dynamic> getProduk() => api.getProduk();

  Future<dynamic> getProdukId(String id) => api.getProdukId(id);

  void createProduk(
          BuildContext context, String nama, String satuan, String harga) =>
      api.createProduk(context, nama, satuan, harga);

  void updateProduk(BuildContext context, int id, String nama, String satuan,
          String harga) =>
      api.updateProduk(context, id, nama, satuan, harga);

  void deleteProdukId(String id) => api.deleteProdukId(id);
}

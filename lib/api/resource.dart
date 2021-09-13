import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Resource {
  var uri = 'https://maisyaroh.com/api';

  Future<dynamic> getProduk() async {
    var url = Uri.parse('$uri/produk');
    var res = await http.get(url);

    if (res.statusCode == 200) {
      return res.body;
    }
  }

  Future<dynamic> getProdukId(String id) async {
    var url = Uri.parse('$uri/produk/$id');
    var res = await http.get(url);

    if (res.statusCode == 200) {
      return res.body;
    }
  }

  void createProduk(
      BuildContext context, String nama, String satuan, String harga) async {
    var body = jsonEncode({'nama': nama, 'satuan': satuan, 'harga': harga});
    var url = Uri.parse('$uri/produk');
    var res = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (res.statusCode == 201) {
      print(res.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Berhasil menambah data!')),
      );
    }
  }

  void updateProduk(BuildContext context, int id, String nama, String satuan,
      String harga) async {
    var body = jsonEncode({'nama': nama, 'satuan': satuan, 'harga': harga});
    var url = Uri.parse('$uri/produk/$id');
    var res = await http.put(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (res.statusCode == 201) {
      print(res.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Berhasil update data!')),
      );
    }
  }

  void deleteProdukId(String id) async {
    var url = Uri.parse('$uri/produk/$id');
    var res = await http.delete(url);

    if (res.statusCode == 200) {
      // return true;
      print('Berhasil hapus');
    }
  }
}

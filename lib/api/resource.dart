import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/produkIdModel.dart';
import 'package:flutter_application_1/model/produkModel.dart';
import 'package:http/http.dart' as http;

class Resource {
  var uri = 'https://maisyaroh.com/api';

  Future getProduk() async {
    var url = Uri.parse('$uri/produk');
    try {
      final res = await http.get(url).timeout(const Duration(seconds: 11));
      if (res.statusCode == 200) {
        return ProdukModel.fromJson(res.body);
      } else if (res.statusCode == 404) {
        return ProdukModel.fromJson(res.body);
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future getProdukId(String id) async {
    var url = Uri.parse('$uri/produk/$id');
    try {
      final res = await http.get(url).timeout(const Duration(seconds: 11));
      if (res.statusCode == 200) {
        return ProdukIdModel.fromJson(res.body);
      } else if (res.statusCode == 404) {
        return ProdukIdModel.fromJson(res.body);
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
    }
  }

  Future createProduk(
      BuildContext context, String nama, String satuan, String harga) async {
    var body = jsonEncode({'nama': nama, 'satuan': satuan, 'harga': harga});
    var url = Uri.parse('$uri/produk');
    try {
      final res = await http
          .post(
            url,
            headers: {'Content-Type': 'application/json'},
            body: body,
          )
          .timeout(const Duration(seconds: 11));
      if (res.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Berhasil menambah data!')),
        );
        return true;
      } else if (res.statusCode == 404) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menambah data!')),
        );
        return false;
      } else {
        throw Exception('Failure response');
      }
    } on SocketException catch (e) {
      throw Exception(e.toString());
    } on HttpException {
      {
        throw Exception("tidak menemukan post");
      }
    } on FormatException {
      throw Exception("request salah");
    } on TimeoutException catch (e) {
      throw Exception(e.toString());
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

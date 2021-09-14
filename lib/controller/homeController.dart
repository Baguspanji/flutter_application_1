import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/repository.dart';
import 'package:flutter_application_1/model/produkIdModel.dart';
import 'package:flutter_application_1/model/produkModel.dart';
import 'package:rxdart/rxdart.dart';

class HomeController {
  final repository = Repository();

  final _produkFetcher = PublishSubject<ProdukModel>();
  final _produkIdFetcher = PublishSubject<ProdukIdModel>();

  PublishSubject<ProdukModel> get resProduk => _produkFetcher;
  PublishSubject<ProdukIdModel> get resProdukId => _produkIdFetcher;

  void getProduk() async {
    try {
      ProdukModel produkModel = await repository.getProduk();
      _produkFetcher.sink.add(produkModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void getProdukId(String id) async {
    try {
      ProdukIdModel produkIdModel = await repository.getProdukId(id);
      _produkIdFetcher.sink.add(produkIdModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void addProduk(
      BuildContext context, String nama, String satuan, String harga) async {
    try {
      await repository.createProduk(context, nama, satuan, harga);
    } catch (e) {
      print(e.toString());
    }
  }

  void dispose() {
    _produkFetcher.close();
    _produkIdFetcher.close();
  }
}

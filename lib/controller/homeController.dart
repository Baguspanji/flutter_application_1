import 'package:flutter_application_1/api/repository.dart';
import 'package:flutter_application_1/model/produkModel.dart';
import 'package:rxdart/rxdart.dart';

class HomeController {
  final repository = Repository();

  final _produkFetcher = PublishSubject<ProdukModel>();

  PublishSubject<ProdukModel> get resProduk => _produkFetcher;

  void getProduk() async {
    try {
      ProdukModel produkModel = await repository.getProduk();
      _produkFetcher.sink.add(produkModel);
    } catch (e) {
      print(e.toString());
    }
  }

  void dispose() {
    _produkFetcher.close();
  }
}

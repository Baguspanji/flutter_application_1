// To parse this JSON data, do
//
//     final produkIdModel = produkIdModelFromMap(jsonString);

import 'dart:convert';

class ProdukIdModel {
  ProdukIdModel({
    this.data,
  });

  Data? data;

  factory ProdukIdModel.fromJson(String str) =>
      ProdukIdModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProdukIdModel.fromMap(Map<String, dynamic> json) => ProdukIdModel(
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data!.toMap(),
      };
}

class Data {
  Data({
    this.id,
    this.nama,
    this.satuan,
    this.harga,
    this.tanggal,
  });

  int? id;
  String? nama;
  String? satuan;
  String? harga;
  DateTime? tanggal;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        id: json["id"],
        nama: json["nama"],
        satuan: json["satuan"],
        harga: json["harga"],
        tanggal: DateTime.parse(json["tanggal"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nama": nama,
        "satuan": satuan,
        "harga": harga,
        "tanggal": tanggal!.toIso8601String(),
      };
}

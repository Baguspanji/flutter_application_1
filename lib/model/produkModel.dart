// To parse this JSON data, do
//
//     final produkModel = produkModelFromMap(jsonString);

import 'dart:convert';

class ProdukModel {
  ProdukModel({
    this.data,
  });

  List<Datum>? data;

  factory ProdukModel.fromJson(String str) =>
      ProdukModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProdukModel.fromMap(Map<String, dynamic> json) => ProdukModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
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

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
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

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/resource.dart';

class HomeDetail extends StatefulWidget {
  final int? id;
  const HomeDetail({Key? key, this.id}) : super(key: key);

  @override
  _HomeDetailState createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail> {
  String nama = '';
  String satuan = '';
  String harga = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res = await Resource().getProdukId(widget.id.toString());
    var json = jsonDecode(res) as Map<String, dynamic>;
    dynamic data = json['data'];
    nama = data['nama'];
    satuan = data['satuan'];
    harga = data['harga'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Card(
          child: ListTile(
            title: Text(
              nama,
              style: TextStyle(fontSize: 30),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  satuan,
                  style: TextStyle(fontSize: 28),
                ),
                Text(
                  harga,
                  style: TextStyle(fontSize: 28),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

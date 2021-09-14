import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/resource.dart';
import 'package:flutter_application_1/controller/homeController.dart';
import 'package:flutter_application_1/homeAdd.dart';
import 'package:flutter_application_1/homeDetail.dart';
import 'package:flutter_application_1/model/produkModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final con = HomeController();

  @override
  void initState() {
    super.initState();
    con.getProduk();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: RefreshIndicator(
            onRefresh: () async {
              con.getProduk();
            },
            child: StreamBuilder<ProdukModel>(
              stream: con.resProduk.stream,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  if (snapshot.data!.data == null) {
                    return Center(
                      child: Text('Data Kosong'),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.data!.length,
                      itemBuilder: (context, index) {
                        Datum produk = snapshot.data!.data![index];
                        return buildItem(
                            produk.id!, produk.nama!, produk.harga!);
                      },
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF838C8A),
        elevation: 8,
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeAdd(),
            )),
        child: Icon(Icons.add, size: 30),
      ),
    );
  }

  Widget buildItem(int id, String title, String subtitle) {
    return Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(
          'Rp $subtitle',
          style: TextStyle(fontSize: 20),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetail(id: id),
            )),
      ),
    );
  }
}

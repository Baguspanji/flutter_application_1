import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/resource.dart';
import 'package:flutter_application_1/homeAdd.dart';
import 'package:flutter_application_1/homeDetail.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var res = await Resource().getProduk();
    var json = jsonDecode(res) as Map<String, dynamic>;
    data = json['data'];
    setState(() {});
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
            onRefresh: () => getData(),
            child: ListView(
              children: data
                  .map((e) => buildItem(
                        e['id'],
                        e['nama'],
                        e['harga'],
                      ))
                  .toList(),
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

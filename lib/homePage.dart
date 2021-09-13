import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/resource.dart';

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
    print('json = $res');
    print('jsonDecode = $jsonDecode(res)');

    // var json = jsonDecode(res) as Map<String, dynamic>;
    // data = json['data'];
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
          child: ListView(
            children: data
                .map((e) => buildItem(
                      e['nama'],
                      e['harga'],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget buildItem(String title, String subtitle) {
    return Card(
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Belajar')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: ListView(
            children: [
              buildItems('Muhammad Bagus Panji', 'Pasuruan, 18 Mei 1999',
                  'Age 22', 'Tosari Pasuruan'),
              buildItems('Alvin', 'Pasuruan, 22 Agustus 1992', 'Age 29',
                  'Rembang Pasuruan'),
              buildItems('Wildan', 'Pasuruan, 22 Juni 1992', 'Age 29',
                  'Rembang Pasuruan'),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: ElevatedButton(
          child: Text(
            'Button',
            style: TextStyle(fontSize: 30),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
          },
        ),
      ),
    );
  }

  Widget buildItems(String nama, String ttl, String age, String alamat) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.grey, width: 2),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: ListTile(
          leading: Icon(
            Icons.person,
            size: 40,
            color: Colors.blue,
          ),
          title: Text(nama),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ttl),
              Text(age),
              Text(alamat),
            ],
          ),
        ),
      ),
    );
  }
}

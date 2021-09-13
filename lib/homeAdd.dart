import 'package:flutter/material.dart';
import 'package:flutter_application_1/api/resource.dart';

class HomeAdd extends StatefulWidget {
  const HomeAdd({Key? key}) : super(key: key);

  @override
  _HomeAddState createState() => _HomeAddState();
}

class _HomeAddState extends State<HomeAdd> {
  final namaController = TextEditingController();
  final satuanController = TextEditingController();
  final hargaController = TextEditingController();

  addData() {
    String nama = namaController.text;
    String satuan = satuanController.text;
    String harga = hargaController.text;

    if (nama == '' || satuan == '' || harga == '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form harus diisi!')),
      );
    } else {
      Resource().createProduk(context, nama, satuan, harga);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Data'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama', style: TextStyle(fontSize: 20)),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1),
              ),
              child: TextField(
                controller: namaController,
                style: TextStyle(fontSize: 28),
              ),
            ),
            Text('Satuan', style: TextStyle(fontSize: 20)),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1),
              ),
              child: TextField(
                controller: satuanController,
                style: TextStyle(fontSize: 28),
              ),
            ),
            Text('Harga', style: TextStyle(fontSize: 20)),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              padding: EdgeInsets.all(10),
              height: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(width: 1),
              ),
              child: TextField(
                controller: hargaController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 28),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFF838C8A)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                onPressed: () => addData(),
                child: Text('Simpan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

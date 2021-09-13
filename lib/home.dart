import 'package:flutter/material.dart';
import 'package:flutter_application_1/homePage.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF838C8A),
        title: Text(
          'Profil Page',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  height: MediaQuery.of(context).size.width * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(80),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/panji.png')),
                  ),
                ),
              ),
              buildItems('Jasmine Crew'),
              buildItems('Age 21'),
              buildItems('May 29 1999'),
              buildItems('New York, USA'),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(0xFF838C8A)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                  child: Text('Get Produk'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildItems(String title) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: Colors.grey, width: 2),
      ),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(6),
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(fontSize: 28),
          ),
        ),
      ),
    );
  }
}

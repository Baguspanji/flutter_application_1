import 'package:http/http.dart' as http;

class Resource {
  var uri = 'https://maisyaroh.com/api';

  void getProduk() async {
    var url = Uri.parse(uri + '/produk');
    var res = await http.get(url);

    if (res.statusCode == 200) {
      print(res.body);
    }
  }
}

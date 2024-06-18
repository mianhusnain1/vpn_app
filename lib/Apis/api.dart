import 'dart:developer';
import 'package:csv/csv.dart';
import 'package:http/http.dart';

class API {
  static Future<void> getVpnServer() async {
    final response =
        await get(Uri.parse('https://www.vpngate.net/api/iphone/'));
    log(response.body);
    final csvstring = response.body.split('#')[1].replaceAll('*', ' ');
    List<List<dynamic>> list = const CsvToListConverter().convert(csvstring);
    // if (response.statusCode == 200) {
    //   // final data = jsonDecode(response.body);
    //   print(response.body);
    // } else {
    //   print("Failed to load data");
    // }
  }
}

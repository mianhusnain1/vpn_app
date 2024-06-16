import 'dart:developer';
import 'package:csv/csv.dart';
import 'package:http/http.dart';
import 'package:vpn_app/Model/Apimodel.dart';

class API {
  static Future<void> getVpnServer() async {
    try {
      final List<Vpn> vpnlist = [];
      final response =
          await get(Uri.parse('https://www.vpngate.net/api/iphone/'));
      log(response.body);
      final csvstring = response.body.split('#')[1].replaceAll('*', ' ');
      List<List<dynamic>> list = const CsvToListConverter().convert(csvstring);
      final header = list[0];

      // as the  0 index is the 1st list and the 1st list is always the header or title.
      for (int i = 0; i < header.length; ++i) {
        Map<String, dynamic> tempJson = {};
        for (int j = 0; j < header.length; ++j) {
          tempJson.addAll({header[j].toString(): list[i][j]});
        }
        vpnlist.add(Vpn.fromJson(tempJson));
        // here i will mention all the enteries that I want to add in the tempjson variable. Json is always start and end at the {}
      }
      log(vpnlist.first.hostname);
    } catch (e) {
      // TODO
      print("Error: $e");
    }
  }
}

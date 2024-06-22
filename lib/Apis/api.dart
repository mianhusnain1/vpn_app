import 'dart:developer';
import 'package:csv/csv.dart';
import 'package:http/http.dart' as http;
import 'package:vpn_app/Model/Apimodel.dart';

class API {
  static Future<List<Vpn>> getVpnServer() async {
    final List<Vpn> vpnlist = [];
    try {
      final response =
          await http.get(Uri.parse('https://www.vpngate.net/api/iphone/'));
      log(response.body);

      // Assuming CSV data starts after the '#' and '*' are replaced with spaces
      final csvstring = response.body.split('#')[1].replaceAll('*', ' ');
      List<List<dynamic>> list = const CsvToListConverter().convert(csvstring);
      final header = list[0];

      for (int i = 1; i < list.length; ++i) {
        Map<String, dynamic> tempJson = {};
        for (int j = 0; j < header.length; ++j) {
          tempJson.addAll({header[j].toString(): list[i][j]});
        }
        vpnlist.add(Vpn.fromJson(tempJson));
      }

      log("First VPN hostname: ${vpnlist.isNotEmpty ? vpnlist.first.hostname : 'No VPN servers'}");
    } catch (e) {
      log("Error: $e");
    }
    return vpnlist;
  }
}

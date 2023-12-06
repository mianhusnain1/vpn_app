import 'dart:convert';
import 'dart:developer';

import 'package:csv/csv.dart';
import 'package:http/http.dart';

class APIs {
  static Future<void> getVPNServer () async{
final response = await get(Uri.parse('https://www.vpngate.net/api/iphone/'));
final csvstring = response.body.split('#')[1].replaceAll('*', ' ');
List<List<dynamic>> list = const CsvToListConverter().convert(csvstring);

final header = list[0];
final tempjson = {};
 // as the  0 index is the 1st list and the 1st list is always the header or title.
for(int i = 0; i < header.length; i ++ ) {
  tempjson.addAll({header[i]: list[1][i]});    // here i will mention all the enteries that I want to add in the tempjson variable. Json is always start and end at the {}
}

// once the csv data is converted to the list there will be 1 header list and multiple data list in that list.
// log(tempjson.toString());
log(jsonEncode(tempjson));//  log(response.body) ;
  }
}
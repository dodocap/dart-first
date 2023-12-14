import 'dart:convert';
import 'package:http/http.dart' as http;
import 'pharmacies.dart';

Future<void> main() async {
  Pharmacies pharmacy = await getMaskInfo();
  final List<Pharmacy> completeInfoStoreList = pharmacy.stores.where((e) => !e.isIncompleteInfo()).toList();
  print(completeInfoStoreList);
  print('총 약국 개수 : ${completeInfoStoreList.length}');
}

Future<Pharmacies> getMaskInfo() async {
  http.Response response = await http.get(Uri.parse('http://104.198.248.76:3000/mask'));

  String encodedString = utf8.decode(response.bodyBytes);
  return Pharmacies.fromJson(jsonDecode(encodedString));
}

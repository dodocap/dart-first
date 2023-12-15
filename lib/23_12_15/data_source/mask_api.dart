import 'package:http/http.dart' as http;
import 'dart:convert';
import '../dto/pharmacies_dto.dart';

class MaskApi {
  Future<PharmaciesDTO> getMaskInfo() async {
    final http.Response response = await http.get(Uri.parse('http://104.198.248.76:3000/mask'));

    final String encodedString = utf8.decode(response.bodyBytes);
    return PharmaciesDTO.fromJson(jsonDecode(encodedString));
  }
}

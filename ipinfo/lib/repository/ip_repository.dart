import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ipinfo/models/ip.dart';

class IpRepository {
  final String _baseUrl = "https://ipinfo.io";
  String get ipToken => "https://ipinfo.io/developers";

  Future<Ip> getIpInfo(String ip) async {
    try {
      final response = await http.get(
        Uri.parse("$_baseUrl/$ip?token=$ipToken"),
        headers: {'Content-type': 'application/json'},
      );

      final json = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return Ip.fromJson(json);
      } else {
        throw Exception("Ip not found");
      }
    } catch (e) {
      throw Exception("Ip not found");
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/paket.dart';

class ApiService {
  static const String _baseUrl = 'http://10.0.2.2:8000/api';

  static Future<List<Paket>> fetchPaketList() async {
    final response = await http.get(Uri.parse('$_baseUrl/pakets'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List paketData = data['pakets'];

      return paketData.map((item) => Paket.fromJson(item)).toList();
    } else {
      throw Exception('Gagal memuat paket');
    }
  }
}
